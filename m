Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 020AD71A03
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 11:42:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 15 Nov 2016 03:42:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,494,1473145200"; d="scan'208";a="901575300"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 15 Nov 2016 03:42:02 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id D97026A4006;
	Tue, 15 Nov 2016 03:41:22 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 13:41:58 +0200
Message-Id: <783306b1b5dc8c4d1d83454ccba14c9cd106708d.1479130124.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2746a0f36a1d8066e0f0c76493115db57b13da4b.1479130124.git.jussi.kukkonen@intel.com>
References: <2746a0f36a1d8066e0f0c76493115db57b13da4b.1479130124.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1479130124.git.jussi.kukkonen@intel.com>
References: <cover.1479130124.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] x11-common: Merge into xserver-nodm-init
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Nov 2016 11:42:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the (non-factual) x utils dependencies from x11-common to
x11 packagegroup.

Remove some obsolete configuration from x11-common:
 * Xsession.d/12keymap.sh: commented out xmodmap call for kdrive
 * default.xmodmap: xmodmap file used by 12keymap.sh
 * Xdefaults: rxvt configuration

At this point x11-common is just /etc/X11/Xsession and three
non-intrusive Xsession scripts: make these explicitly part of
xserver-nodm-init. RCONFLICT with the versions of xserver-common
that also provide these files.

VIRTUAL-RUNTIME_xserver_common is no longer a real abstraction but
preserve the setting for backwards compatibility (if the variable
is set to "xserver-common", the right thing still happens).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/conf/distro/include/distro_alias.inc          |   1 -
 .../packagegroups/packagegroup-core-x11.bb         |   9 +-
 .../x11-common/x11-common/etc/X11/Xdefaults        |   3 -
 .../x11-common/etc/X11/Xsession.d/12keymap.sh      |   4 -
 .../x11-common/x11-common/etc/X11/default.xmodmap  | 260 ---------------
 .../x11-common/x11-common/gplv2-license.patch      | 355 ---------------------
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |  22 --
 .../etc => xserver-nodm-init}/X11/Xsession         |   0
 .../X11/Xsession.d/13xdgbasedirs.sh                |   0
 .../X11/Xsession.d/89xdgautostart.sh               |   0
 .../X11/Xsession.d/90XWindowManager.sh             |   0
 .../x11-common/xserver-nodm-init_3.0.bb            |   5 +
 12 files changed, 11 insertions(+), 648 deletions(-)
 delete mode 100644 meta/recipes-graphics/x11-common/x11-common/etc/X11/Xdefaults
 delete mode 100644 meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/12keymap.sh
 delete mode 100644 meta/recipes-graphics/x11-common/x11-common/etc/X11/default.xmodmap
 delete mode 100644 meta/recipes-graphics/x11-common/x11-common/gplv2-license.patch
 delete mode 100644 meta/recipes-graphics/x11-common/x11-common_0.1.bb
 rename meta/recipes-graphics/x11-common/{x11-common/etc => xserver-nodm-init}/X11/Xsession (100%)
 rename meta/recipes-graphics/x11-common/{x11-common/etc => xserver-nodm-init}/X11/Xsession.d/13xdgbasedirs.sh (100%)
 rename meta/recipes-graphics/x11-common/{x11-common/etc => xserver-nodm-init}/X11/Xsession.d/89xdgautostart.sh (100%)
 rename meta/recipes-graphics/x11-common/{x11-common/etc => xserver-nodm-init}/X11/Xsession.d/90XWindowManager.sh (100%)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 10efb09..a59265a 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -400,7 +400,6 @@ DISTRO_PN_ALIAS_pn-weston = "Fedora=weston OpenSuSE=weston"
 DISTRO_PN_ALIAS_pn-weston-init = "OE-Core"
 DISTRO_PN_ALIAS_pn-which = "Mandriva=which Fedora=which"
 DISTRO_PN_ALIAS_pn-wpa-supplicant = "Meego=wpa_supplicant Fedora=wpa_supplicant OpenSuSE=wpa_supplicant Ubuntu=wpasupplicant Mandriva=wpa_supplicant Debian=wpasupplicant"
-DISTRO_PN_ALIAS_pn-x11-common = "OE-Core"
 DISTRO_PN_ALIAS_pn-x11perf = "Fedora=xorg-x11-apps Ubuntu=x11-apps"
 DISTRO_PN_ALIAS_pn-xcb-util-image = "Debian=xcb-util Fedora=xcb-util"
 DISTRO_PN_ALIAS_pn-xcb-util-keysyms = "Debian=xcb-util Fedora=xcb-util"
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 4291424..001db9e 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -5,13 +5,12 @@
 PR = "r40"
 
 inherit packagegroup distro_features_check
-# rdepends on x11-common
 REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGES = "${PN} ${PN}-utils"
 
-# xserver-common, x11-common
-VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
+# backwards compatibility for xserver-common
+VIRTUAL-RUNTIME_xserver_common ?= ""
 
 # elsa, xserver-nodm-init
 VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
@@ -30,4 +29,8 @@ RDEPENDS_${PN}-utils = "\
     xhost \
     xset \
     xrandr \
+    xmodmap \
+    xdpyinfo \
+    xinput-calibrator \
+    dbus-x11 \
     "
diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xdefaults b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xdefaults
deleted file mode 100644
index f5b69dd..0000000
--- a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xdefaults
+++ /dev/null
@@ -1,3 +0,0 @@
-Rxvt*scrollBar_right: true
-Rxvt*font: xft:Mono:pixelsize=9
-
diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/12keymap.sh b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/12keymap.sh
deleted file mode 100644
index a9d102c..0000000
--- a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/12keymap.sh
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-
-# kdrive 1.4 does not have default keymap in server
-#xmodmap - </etc/X11/default.xmodmap
diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/default.xmodmap b/meta/recipes-graphics/x11-common/x11-common/etc/X11/default.xmodmap
deleted file mode 100644
index 05a13fa..0000000
--- a/meta/recipes-graphics/x11-common/x11-common/etc/X11/default.xmodmap
+++ /dev/null
@@ -1,260 +0,0 @@
-keycode   8 =
-keycode   9 = Escape
-keycode  10 = 1 exclam
-keycode  11 = 2 at
-keycode  12 = 3 numbersign
-keycode  13 = 4 dollar
-keycode  14 = 5 percent
-keycode  15 = 6 asciicircum
-keycode  16 = 7 ampersand braceleft
-keycode  17 = 8 asterisk bracketleft
-keycode  18 = 9 parenleft bracketright
-keycode  19 = 0 parenright braceright
-keycode  20 = minus underscore backslash
-keycode  21 = equal plus
-keycode  22 = BackSpace
-keycode  23 = Tab
-keycode  24 = q Q q
-keycode  25 = w W w
-keycode  26 = e E
-keycode  27 = r R r
-keycode  28 = t T t
-keycode  29 = y Y y
-keycode  30 = u U u
-keycode  31 = i I i
-keycode  32 = o O o
-keycode  33 = p P p
-keycode  34 = bracketleft braceleft
-keycode  35 = bracketright braceright asciitilde
-keycode  36 = Return
-keycode  37 = Control_L
-keycode  38 = a A
-keycode  39 = s S s
-keycode  40 = d D
-keycode  41 = f F
-keycode  42 = g G g
-keycode  43 = h H h
-keycode  44 = j J j
-keycode  45 = k K k
-keycode  46 = l L l
-keycode  47 = semicolon colon
-keycode  48 = apostrophe quotedbl
-keycode  49 = grave asciitilde
-keycode  50 = Shift_L
-keycode  51 = backslash bar
-keycode  52 = z Z z
-keycode  53 = x X x
-keycode  54 = c C
-keycode  55 = v V v
-keycode  56 = b B
-keycode  57 = n N n
-keycode  58 = m M m
-keycode  59 = comma less
-keycode  60 = period greater
-keycode  61 = slash question
-keycode  62 = Shift_R
-keycode  63 = KP_Multiply
-keycode  64 = Alt_L
-keycode  65 = space
-keycode  66 = Caps_Lock
-keycode  67 = F1 F11
-keycode  68 = F2 F12
-keycode  69 = F3 F13
-keycode  70 = F4 F14
-keycode  71 = F5 F15
-keycode  72 = F6 F16
-keycode  73 = F7 F17
-keycode  74 = F8 F18
-keycode  75 = F9 F19
-keycode  76 = F10 F20
-keycode  77 = Num_Lock
-keycode  78 = Scroll_Lock
-keycode  79 = KP_7
-keycode  80 = KP_8
-keycode  81 = KP_9
-keycode  82 = KP_Subtract
-keycode  83 = KP_4
-keycode  84 = KP_5
-keycode  85 = KP_6
-keycode  86 = KP_Add
-keycode  87 = KP_1
-keycode  88 = KP_2
-keycode  89 = KP_3
-keycode  90 = KP_0
-keycode  91 = KP_Decimal
-keycode  92 =
-keycode  93 =
-keycode  94 = less greater bar
-keycode  95 = F11
-keycode  96 = F12
-keycode  97 =
-keycode  98 =
-keycode  99 =
-keycode 100 =
-keycode 101 =
-keycode 102 =
-keycode 103 =
-keycode 104 = KP_Enter
-keycode 105 = Control_R
-keycode 106 = KP_Divide
-keycode 107 =
-keycode 108 = Mode_switch
-keycode 109 = Break
-keycode 110 = Home
-keycode 111 = Up
-keycode 112 = Prior
-keycode 113 = Left
-keycode 114 = Right
-keycode 115 = End
-keycode 116 = Down
-keycode 117 = Next
-keycode 118 = Insert
-keycode 119 = Delete
-keycode 120 = Menu
-keycode 121 = F13
-keycode 122 = F14
-keycode 123 = Help
-keycode 124 = Execute
-keycode 125 = F17
-keycode 126 = KP_Subtract
-keycode 127 = Pause
-keycode 128 =
-keycode 129 =
-keycode 130 =
-keycode 131 =
-keycode 132 =
-keycode 133 =
-keycode 134 =
-keycode 135 =
-keycode 136 =
-keycode 137 =
-keycode 138 =
-keycode 139 =
-keycode 140 =
-keycode 141 =
-keycode 142 =
-keycode 143 =
-keycode 144 =
-keycode 145 =
-keycode 146 =
-keycode 147 =
-keycode 148 =
-keycode 149 =
-keycode 150 =
-keycode 151 =
-keycode 152 =
-keycode 153 =
-keycode 154 =
-keycode 155 =
-keycode 156 =
-keycode 157 =
-keycode 158 =
-keycode 159 =
-keycode 160 =
-keycode 161 =
-keycode 162 =
-keycode 163 =
-keycode 164 =
-keycode 165 =
-keycode 166 =
-keycode 167 =
-keycode 168 =
-keycode 169 =
-keycode 170 =
-keycode 171 =
-keycode 172 =
-keycode 173 =
-keycode 174 =
-keycode 175 =
-keycode 176 =
-keycode 177 =
-keycode 178 =
-keycode 179 =
-keycode 180 =
-keycode 181 =
-keycode 182 =
-keycode 183 =
-keycode 184 =
-keycode 185 =
-keycode 186 =
-keycode 187 =
-keycode 188 =
-keycode 189 =
-keycode 190 =
-keycode 191 =
-keycode 192 =
-keycode 193 =
-keycode 194 =
-keycode 195 =
-keycode 196 =
-keycode 197 =
-keycode 198 =
-keycode 199 =
-keycode 200 =
-keycode 201 =
-keycode 202 =
-keycode 203 =
-keycode 204 =
-keycode 205 =
-keycode 206 =
-keycode 207 =
-keycode 208 =
-keycode 209 =
-keycode 210 =
-keycode 211 =
-keycode 212 =
-keycode 213 =
-keycode 214 =
-keycode 215 =
-keycode 216 =
-keycode 217 =
-keycode 218 =
-keycode 219 =
-keycode 220 =
-keycode 221 =
-keycode 222 =
-keycode 223 =
-keycode 224 =
-keycode 225 =
-keycode 226 =
-keycode 227 =
-keycode 228 =
-keycode 229 =
-keycode 230 =
-keycode 231 =
-keycode 232 =
-keycode 233 =
-keycode 234 =
-keycode 235 =
-keycode 236 =
-keycode 237 =
-keycode 238 =
-keycode 239 =
-keycode 240 =
-keycode 241 =
-keycode 242 =
-keycode 243 =
-keycode 244 =
-keycode 245 =
-keycode 246 =
-keycode 247 =
-keycode 248 =
-keycode 249 =
-keycode 250 =
-keycode 251 =
-keycode 252 =
-keycode 253 =
-keycode 254 =
-
-add shift = Shift_L
-add shift = Shift_R
-add shift = Menu
-add lock = Caps_Lock
-add control = Control_L
-add control = Control_R
-add mod1 = Alt_L
-add mod2 = Num_Lock
-!mod3      
-add mod4 = Mode_switch
-!mod5      
-
diff --git a/meta/recipes-graphics/x11-common/x11-common/gplv2-license.patch b/meta/recipes-graphics/x11-common/x11-common/gplv2-license.patch
deleted file mode 100644
index eff975e..0000000
--- a/meta/recipes-graphics/x11-common/x11-common/gplv2-license.patch
+++ /dev/null
@@ -1,355 +0,0 @@
-COPYING: add GPLv2 license file
-
-this is a local file recipe and the license file is missing.In order
-to pass the license checksum checking, the license file is needed. So
-this patch add the GPLv2 license file.
-
-Upstream-Status: Inappropriate [licensing]
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-
-diff --git a/COPYING b/COPYING
-new file mode 100644
-index 0000000..d511905
---- /dev/null
-+++ b/COPYING
-@@ -0,0 +1,339 @@
-+		    GNU GENERAL PUBLIC LICENSE
-+		       Version 2, June 1991
-+
-+ Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
-+ 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-+ Everyone is permitted to copy and distribute verbatim copies
-+ of this license document, but changing it is not allowed.
-+
-+			    Preamble
-+
-+  The licenses for most software are designed to take away your
-+freedom to share and change it.  By contrast, the GNU General Public
-+License is intended to guarantee your freedom to share and change free
-+software--to make sure the software is free for all its users.  This
-+General Public License applies to most of the Free Software
-+Foundation's software and to any other program whose authors commit to
-+using it.  (Some other Free Software Foundation software is covered by
-+the GNU Lesser General Public License instead.)  You can apply it to
-+your programs, too.
-+
-+  When we speak of free software, we are referring to freedom, not
-+price.  Our General Public Licenses are designed to make sure that you
-+have the freedom to distribute copies of free software (and charge for
-+this service if you wish), that you receive source code or can get it
-+if you want it, that you can change the software or use pieces of it
-+in new free programs; and that you know you can do these things.
-+
-+  To protect your rights, we need to make restrictions that forbid
-+anyone to deny you these rights or to ask you to surrender the rights.
-+These restrictions translate to certain responsibilities for you if you
-+distribute copies of the software, or if you modify it.
-+
-+  For example, if you distribute copies of such a program, whether
-+gratis or for a fee, you must give the recipients all the rights that
-+you have.  You must make sure that they, too, receive or can get the
-+source code.  And you must show them these terms so they know their
-+rights.
-+
-+  We protect your rights with two steps: (1) copyright the software, and
-+(2) offer you this license which gives you legal permission to copy,
-+distribute and/or modify the software.
-+
-+  Also, for each author's protection and ours, we want to make certain
-+that everyone understands that there is no warranty for this free
-+software.  If the software is modified by someone else and passed on, we
-+want its recipients to know that what they have is not the original, so
-+that any problems introduced by others will not reflect on the original
-+authors' reputations.
-+
-+  Finally, any free program is threatened constantly by software
-+patents.  We wish to avoid the danger that redistributors of a free
-+program will individually obtain patent licenses, in effect making the
-+program proprietary.  To prevent this, we have made it clear that any
-+patent must be licensed for everyone's free use or not licensed at all.
-+
-+  The precise terms and conditions for copying, distribution and
-+modification follow.
-+
-+		    GNU GENERAL PUBLIC LICENSE
-+   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
-+
-+  0. This License applies to any program or other work which contains
-+a notice placed by the copyright holder saying it may be distributed
-+under the terms of this General Public License.  The "Program", below,
-+refers to any such program or work, and a "work based on the Program"
-+means either the Program or any derivative work under copyright law:
-+that is to say, a work containing the Program or a portion of it,
-+either verbatim or with modifications and/or translated into another
-+language.  (Hereinafter, translation is included without limitation in
-+the term "modification".)  Each licensee is addressed as "you".
-+
-+Activities other than copying, distribution and modification are not
-+covered by this License; they are outside its scope.  The act of
-+running the Program is not restricted, and the output from the Program
-+is covered only if its contents constitute a work based on the
-+Program (independent of having been made by running the Program).
-+Whether that is true depends on what the Program does.
-+
-+  1. You may copy and distribute verbatim copies of the Program's
-+source code as you receive it, in any medium, provided that you
-+conspicuously and appropriately publish on each copy an appropriate
-+copyright notice and disclaimer of warranty; keep intact all the
-+notices that refer to this License and to the absence of any warranty;
-+and give any other recipients of the Program a copy of this License
-+along with the Program.
-+
-+You may charge a fee for the physical act of transferring a copy, and
-+you may at your option offer warranty protection in exchange for a fee.
-+
-+  2. You may modify your copy or copies of the Program or any portion
-+of it, thus forming a work based on the Program, and copy and
-+distribute such modifications or work under the terms of Section 1
-+above, provided that you also meet all of these conditions:
-+
-+    a) You must cause the modified files to carry prominent notices
-+    stating that you changed the files and the date of any change.
-+
-+    b) You must cause any work that you distribute or publish, that in
-+    whole or in part contains or is derived from the Program or any
-+    part thereof, to be licensed as a whole at no charge to all third
-+    parties under the terms of this License.
-+
-+    c) If the modified program normally reads commands interactively
-+    when run, you must cause it, when started running for such
-+    interactive use in the most ordinary way, to print or display an
-+    announcement including an appropriate copyright notice and a
-+    notice that there is no warranty (or else, saying that you provide
-+    a warranty) and that users may redistribute the program under
-+    these conditions, and telling the user how to view a copy of this
-+    License.  (Exception: if the Program itself is interactive but
-+    does not normally print such an announcement, your work based on
-+    the Program is not required to print an announcement.)
-+
-+These requirements apply to the modified work as a whole.  If
-+identifiable sections of that work are not derived from the Program,
-+and can be reasonably considered independent and separate works in
-+themselves, then this License, and its terms, do not apply to those
-+sections when you distribute them as separate works.  But when you
-+distribute the same sections as part of a whole which is a work based
-+on the Program, the distribution of the whole must be on the terms of
-+this License, whose permissions for other licensees extend to the
-+entire whole, and thus to each and every part regardless of who wrote it.
-+
-+Thus, it is not the intent of this section to claim rights or contest
-+your rights to work written entirely by you; rather, the intent is to
-+exercise the right to control the distribution of derivative or
-+collective works based on the Program.
-+
-+In addition, mere aggregation of another work not based on the Program
-+with the Program (or with a work based on the Program) on a volume of
-+a storage or distribution medium does not bring the other work under
-+the scope of this License.
-+
-+  3. You may copy and distribute the Program (or a work based on it,
-+under Section 2) in object code or executable form under the terms of
-+Sections 1 and 2 above provided that you also do one of the following:
-+
-+    a) Accompany it with the complete corresponding machine-readable
-+    source code, which must be distributed under the terms of Sections
-+    1 and 2 above on a medium customarily used for software interchange; or,
-+
-+    b) Accompany it with a written offer, valid for at least three
-+    years, to give any third party, for a charge no more than your
-+    cost of physically performing source distribution, a complete
-+    machine-readable copy of the corresponding source code, to be
-+    distributed under the terms of Sections 1 and 2 above on a medium
-+    customarily used for software interchange; or,
-+
-+    c) Accompany it with the information you received as to the offer
-+    to distribute corresponding source code.  (This alternative is
-+    allowed only for noncommercial distribution and only if you
-+    received the program in object code or executable form with such
-+    an offer, in accord with Subsection b above.)
-+
-+The source code for a work means the preferred form of the work for
-+making modifications to it.  For an executable work, complete source
-+code means all the source code for all modules it contains, plus any
-+associated interface definition files, plus the scripts used to
-+control compilation and installation of the executable.  However, as a
-+special exception, the source code distributed need not include
-+anything that is normally distributed (in either source or binary
-+form) with the major components (compiler, kernel, and so on) of the
-+operating system on which the executable runs, unless that component
-+itself accompanies the executable.
-+
-+If distribution of executable or object code is made by offering
-+access to copy from a designated place, then offering equivalent
-+access to copy the source code from the same place counts as
-+distribution of the source code, even though third parties are not
-+compelled to copy the source along with the object code.
-+
-+  4. You may not copy, modify, sublicense, or distribute the Program
-+except as expressly provided under this License.  Any attempt
-+otherwise to copy, modify, sublicense or distribute the Program is
-+void, and will automatically terminate your rights under this License.
-+However, parties who have received copies, or rights, from you under
-+this License will not have their licenses terminated so long as such
-+parties remain in full compliance.
-+
-+  5. You are not required to accept this License, since you have not
-+signed it.  However, nothing else grants you permission to modify or
-+distribute the Program or its derivative works.  These actions are
-+prohibited by law if you do not accept this License.  Therefore, by
-+modifying or distributing the Program (or any work based on the
-+Program), you indicate your acceptance of this License to do so, and
-+all its terms and conditions for copying, distributing or modifying
-+the Program or works based on it.
-+
-+  6. Each time you redistribute the Program (or any work based on the
-+Program), the recipient automatically receives a license from the
-+original licensor to copy, distribute or modify the Program subject to
-+these terms and conditions.  You may not impose any further
-+restrictions on the recipients' exercise of the rights granted herein.
-+You are not responsible for enforcing compliance by third parties to
-+this License.
-+
-+  7. If, as a consequence of a court judgment or allegation of patent
-+infringement or for any other reason (not limited to patent issues),
-+conditions are imposed on you (whether by court order, agreement or
-+otherwise) that contradict the conditions of this License, they do not
-+excuse you from the conditions of this License.  If you cannot
-+distribute so as to satisfy simultaneously your obligations under this
-+License and any other pertinent obligations, then as a consequence you
-+may not distribute the Program at all.  For example, if a patent
-+license would not permit royalty-free redistribution of the Program by
-+all those who receive copies directly or indirectly through you, then
-+the only way you could satisfy both it and this License would be to
-+refrain entirely from distribution of the Program.
-+
-+If any portion of this section is held invalid or unenforceable under
-+any particular circumstance, the balance of the section is intended to
-+apply and the section as a whole is intended to apply in other
-+circumstances.
-+
-+It is not the purpose of this section to induce you to infringe any
-+patents or other property right claims or to contest validity of any
-+such claims; this section has the sole purpose of protecting the
-+integrity of the free software distribution system, which is
-+implemented by public license practices.  Many people have made
-+generous contributions to the wide range of software distributed
-+through that system in reliance on consistent application of that
-+system; it is up to the author/donor to decide if he or she is willing
-+to distribute software through any other system and a licensee cannot
-+impose that choice.
-+
-+This section is intended to make thoroughly clear what is believed to
-+be a consequence of the rest of this License.
-+
-+  8. If the distribution and/or use of the Program is restricted in
-+certain countries either by patents or by copyrighted interfaces, the
-+original copyright holder who places the Program under this License
-+may add an explicit geographical distribution limitation excluding
-+those countries, so that distribution is permitted only in or among
-+countries not thus excluded.  In such case, this License incorporates
-+the limitation as if written in the body of this License.
-+
-+  9. The Free Software Foundation may publish revised and/or new versions
-+of the General Public License from time to time.  Such new versions will
-+be similar in spirit to the present version, but may differ in detail to
-+address new problems or concerns.
-+
-+Each version is given a distinguishing version number.  If the Program
-+specifies a version number of this License which applies to it and "any
-+later version", you have the option of following the terms and conditions
-+either of that version or of any later version published by the Free
-+Software Foundation.  If the Program does not specify a version number of
-+this License, you may choose any version ever published by the Free Software
-+Foundation.
-+
-+  10. If you wish to incorporate parts of the Program into other free
-+programs whose distribution conditions are different, write to the author
-+to ask for permission.  For software which is copyrighted by the Free
-+Software Foundation, write to the Free Software Foundation; we sometimes
-+make exceptions for this.  Our decision will be guided by the two goals
-+of preserving the free status of all derivatives of our free software and
-+of promoting the sharing and reuse of software generally.
-+
-+			    NO WARRANTY
-+
-+  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
-+FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
-+OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
-+PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
-+OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
-+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
-+TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
-+PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
-+REPAIR OR CORRECTION.
-+
-+  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
-+WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
-+REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
-+INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
-+OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
-+TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
-+YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
-+PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
-+POSSIBILITY OF SUCH DAMAGES.
-+
-+		     END OF TERMS AND CONDITIONS
-+
-+	    How to Apply These Terms to Your New Programs
-+
-+  If you develop a new program, and you want it to be of the greatest
-+possible use to the public, the best way to achieve this is to make it
-+free software which everyone can redistribute and change under these terms.
-+
-+  To do so, attach the following notices to the program.  It is safest
-+to attach them to the start of each source file to most effectively
-+convey the exclusion of warranty; and each file should have at least
-+the "copyright" line and a pointer to where the full notice is found.
-+
-+    <one line to give the program's name and a brief idea of what it does.>
-+    Copyright (C) <year>  <name of author>
-+
-+    This program is free software; you can redistribute it and/or modify
-+    it under the terms of the GNU General Public License as published by
-+    the Free Software Foundation; either version 2 of the License, or
-+    (at your option) any later version.
-+
-+    This program is distributed in the hope that it will be useful,
-+    but WITHOUT ANY WARRANTY; without even the implied warranty of
-+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+    GNU General Public License for more details.
-+
-+    You should have received a copy of the GNU General Public License along
-+    with this program; if not, write to the Free Software Foundation, Inc.,
-+    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-+
-+Also add information on how to contact you by electronic and paper mail.
-+
-+If the program is interactive, make it output a short notice like this
-+when it starts in an interactive mode:
-+
-+    Gnomovision version 69, Copyright (C) year name of author
-+    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
-+    This is free software, and you are welcome to redistribute it
-+    under certain conditions; type `show c' for details.
-+
-+The hypothetical commands `show w' and `show c' should show the appropriate
-+parts of the General Public License.  Of course, the commands you use may
-+be called something other than `show w' and `show c'; they could even be
-+mouse-clicks or menu items--whatever suits your program.
-+
-+You should also get your employer (if you work as a programmer) or your
-+school, if any, to sign a "copyright disclaimer" for the program, if
-+necessary.  Here is a sample; alter the names:
-+
-+  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
-+  `Gnomovision' (which makes passes at compilers) written by James Hacker.
-+
-+  <signature of Ty Coon>, 1 April 1989
-+  Ty Coon, President of Vice
-+
-+This General Public License does not permit incorporating your program into
-+proprietary programs.  If your program is a subroutine library, you may
-+consider it more useful to permit linking proprietary applications with the
-+library.  If this is what you want to do, use the GNU Lesser General
-+Public License instead of this License.
diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
deleted file mode 100644
index ab9a939..0000000
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Common X11 scripts and configuration files"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-SECTION = "x11"
-PR = "r47"
-
-inherit distro_features_check
-# rdepends on xdypinfo xmodmap xinit
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI = "file://etc \
-           file://gplv2-license.patch"
-
-S = "${WORKDIR}"
-
-do_install() {
-	cp -R ${S}/etc ${D}${sysconfdir}
-	chmod -R 755 ${D}${sysconfdir}
-}
-
-RDEPENDS_${PN} = "dbus-x11 xmodmap xdpyinfo xinput-calibrator formfactor"
-
diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession b/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession
similarity index 100%
rename from meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession
rename to meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession
diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh b/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/13xdgbasedirs.sh
similarity index 100%
rename from meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/13xdgbasedirs.sh
rename to meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/13xdgbasedirs.sh
diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/89xdgautostart.sh b/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/89xdgautostart.sh
similarity index 100%
rename from meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/89xdgautostart.sh
rename to meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/89xdgautostart.sh
diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/90XWindowManager.sh b/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/90XWindowManager.sh
similarity index 100%
rename from meta/recipes-graphics/x11-common/x11-common/etc/X11/Xsession.d/90XWindowManager.sh
rename to meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/90XWindowManager.sh
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index a6d0d5e..62da118 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -6,6 +6,7 @@ PR = "r31"
 
 SRC_URI = "file://xserver-nodm \
            file://Xserver \
+           file://X11 \
            file://gplv2-license.patch \
            file://xserver-nodm.service.in \
            file://xserver-nodm.conf.in \
@@ -29,6 +30,9 @@ do_install() {
     install xserver-nodm.conf.in ${D}${sysconfdir}/default/xserver-nodm
     install -d ${D}${sysconfdir}/xserver-nodm
     install Xserver ${D}${sysconfdir}/xserver-nodm/Xserver
+    install -d ${D}${sysconfdir}/X11/Xsession.d
+    install X11/Xsession.d/* ${D}${sysconfdir}/X11/Xsession.d/
+    install X11/Xsession ${D}${sysconfdir}/X11/
 
     BLANK_ARGS="${@bb.utils.contains('PACKAGECONFIG', 'blank', '', '-s 0 -dpms', d)}"
     if [ "${ROOTLESS_X}" = "1" ] ; then
@@ -59,3 +63,4 @@ INITSCRIPT_NAME = "xserver-nodm"
 INITSCRIPT_PARAMS = "start 9 5 . stop 20 0 1 2 3 6 ."
 SYSTEMD_SERVICE_${PN} = "xserver-nodm.service"
 
+RCONFLICTS_${PN} = "xserver-common (< 1.34-r9) x11-common"
-- 
2.1.4


