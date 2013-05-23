Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA7D6A44E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 15:28:23 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A355DF811F1; Thu, 23 May 2013 09:28:24 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 37B56F811DE;
	Thu, 23 May 2013 09:28:22 -0600 (MDT)
Message-ID: <519E359B.2010203@mlbassoc.com>
Date: Thu, 23 May 2013 09:28:27 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Shortened git hashes causing pain
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
X-List-Received-Date: Thu, 23 May 2013 15:28:24 -0000
X-Groupsio-MsgNum: 39654
Content-Type: multipart/mixed; boundary="------------070405070002060600050008"

--------------070405070002060600050008
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The shortening of the git hashes in this commit
   commit 77fc40a0f843e2488b356d90b64ef436c11c9973
   Author: Richard Purdie <richard.purdie@linuxfoundation.org>
   Date:   Sun May 19 13:21:55 2013 +0300
     bitbake: fetch2: Shorten long srcrevs
is causing some problems.

I have a simple .bbappend for gtk-sato-engine (attached) which
just applies a one-line patch.  When I build this recipe, I
get two different work trees (this is from scratch):
$ ls -l tmp/work/cobra4430p82-amltd-linux-gnueabi/gtk-sato-engine
total 8
drwxrwxr-x  3 gthomas gthomas 4096 May 23 09:12 0.3.3+gitAUTOINC+4740ad8d53aba4368ce3e03b06cfdc69eb86dcdc-r0
drwxrwxr-x 11 gthomas gthomas 4096 May 23 09:13 0.3.3+gitAUTOINC+4740ad8d53-r0

Note: it doesn't seem to happen for the virgin gtk-sato-engine
recipe, only when my patch is applied.

I discovered this when I tried building in an existing tree which
had been built before the mentioned change to the fetch code.  There
were sstate files that used the long hash that the build seemed to
want to use but got terribly confused and ended up creating empty
packages, breaking my build.  Trying to run 'cleansstate' on the
failing packages did nothing as the code only cleans up based on
the new hash and left the old files still there...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

--------------070405070002060600050008
Content-Type: text/plain; charset=UTF-8;
 name="gtk-sato-engine_git.bbappend"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="gtk-sato-engine_git.bbappend"

#
# Just tell BitBake where to find my component files
#
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " file://adjust-sato-theme.patch \
"

PACKAGE_ARCH = "${MACHINE_ARCH}"






--------------070405070002060600050008
Content-Type: text/x-patch;
 name="adjust-sato-theme.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="adjust-sato-theme.patch"

Index: git/data/gtkrc-vga
===================================================================
--- git.orig/data/gtkrc-vga
+++ git/data/gtkrc-vga
@@ -5,7 +5,7 @@
 #   dark gray: cbccc9
 #   light gray: eeeeec
 
-gtk_button_images = 0
+gtk_button_images = 1
 gtk_menu_images = 0
 
 gtk_color_scheme = "bg_color:#eeeeec;fg_color:#555753;text_color:#555753;base_color:#fff;selected_bg_color:#6c3;selected_fg_color:#555753"

--------------070405070002060600050008--
