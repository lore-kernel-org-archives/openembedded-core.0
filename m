Return-Path: <rtartler.desres@gmail.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 54140731AC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 21:59:08 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id c198so62938209ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2016 14:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=LmEaSRw9xsqIm6Rl/ofZDvqsE8NpcuwlT2qV+zunMUQ=;
	b=G6loSMrZaxZM18BK/Qts0AF9xF0hB8RvsGw9NNptNiNVesdwcLL8NphzpEQ+eDtrhd
	q9tfrt+yDbKCuhq7Ya5POPcXyotT5Ev/mmHzGKLTuh240+s1bYRW6mRCpYe4pyT7oez2
	3AsLbAa6LH2imjNuTbeCeL6P1UU+lQs9g+/JXhZf8San3CopLrMRciPWgOhXNGiuxM+G
	BiRRagTPp3q8yAKAam8qtsShf2ADTRiBtK+7m8adlbvcqbnX9Q1AAYivMhumeloh7cbg
	nzIYlHb35yy5Go3Qbxhj8dKIQcQJA0G3xMflDz6bwixcOMaM7oTNn4x6JNNrPM5BpKkA
	2Ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=LmEaSRw9xsqIm6Rl/ofZDvqsE8NpcuwlT2qV+zunMUQ=;
	b=Ksb3LoEBh8uPJQ9DSsLhNY6tGduVh6T60VWEb7ap2hYg6FFVLDt58p89Coh0MmhTsr
	PfOLoRPQf/6OglA5N+AFmA4D2CR5MAjEGgfjKDi2x0yUDgG+F9Gjkm8Od5xEeedCXDiK
	vLqAeGmcEdgyUzFHvsQrwcPinJk7gyUgSSyPK+NOJ6DwHXp3TIJBRVoER0znbmMy2ABP
	IUl+MPhFkxg7AEUEjL+r+c6bgh3M7b6/it61rtwqvCntclaxOX4lEEFvppZALBFrACKF
	K6B8C65oMACHsLsU+JN4AfXWi4tz8rXdaNOw1xYwai/OQL6Vfxha3d9gLVWYJmLFJHwM
	bn2w==
X-Gm-Message-State: AE9vXwO1eZdR2JMvAnea5K6yDA5zm2Yxf+BDLrGmuhxHLo0ufdfRkQ/v3GLTGHX/6lINQ4vgHYmjsFbWZBWuWQ==
X-Received: by 10.107.156.202 with SMTP id f193mr1654050ioe.186.1472853548853; 
	Fri, 02 Sep 2016 14:59:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.254.202 with HTTP; Fri, 2 Sep 2016 14:59:08 -0700 (PDT)
From: Reinhard Tartler <rtartler.desres@gmail.com>
Date: Fri, 2 Sep 2016 17:59:08 -0400
Message-ID: <CADNFeU78hx7jdvgqjaDVK+RkfMw3P1yeruk5urUSkmbxWCS5Xg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] package_manager.py: Restore FEED_DEPLOYDIR_BASE_URI functionality
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
X-List-Received-Date: Fri, 02 Sep 2016 21:59:09 -0000
Content-Type: multipart/alternative; boundary=001a1140b8f495f20a053b8d70da

--001a1140b8f495f20a053b8d70da
Content-Type: text/plain; charset=UTF-8

According to the documentation, setting FEED_DEPLOYDIR_BASE_URI should
be sufficient for setting up local feeds. This commit fixes the
implementation to actually do that, even if BUILD_IMAGES_FROM_FEEDS is
not set.

Also fix some bugs in the old implementation:
 - Fetch uncompressed Packages files, because
   'bitbake package-index' does not appear to create Packages.gz files.
 - Add missing newline after the URI so that the options don't end up on
   the same line.
 - Fix the check when local options are necessary.

Signed-off-by: Reinhard Tartler <tartler@deshaw.com>
---
 meta/lib/oe/package_manager.py | 59 +++++++++++++++++++++++-------
------------
 1 file changed, 32 insertions(+), 27 deletions(-)
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2802254..e92bbbd 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1649,33 +1649,36 @@ class OpkgPM(OpkgDpkgPM):

                     config_file.write("src/gz %s %s\n" % (feed_name,
feed_uri))

-            """
-            Allow to use package deploy directory contents as quick
devel-testing
-            feed. This creates individual feed configs for each arch
subdir of those
-            specified as compatible for the current machine.
-            NOTE: Development-helper feature, NOT a full-fledged feed.
-            """
-            if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI', True) or "") !=
"":
-                for arch in self.pkg_archs.split():
-                    cfg_file_name = os.path.join(self.target_rootfs,
-
self.d.getVar("sysconfdir", True),
-                                                 "opkg",
-                                                 "local-%s-feed.conf" %
arch)
-
-                    with open(cfg_file_name, "w+") as cfg_file:
-                        cfg_file.write("src/gz local-%s %s/%s" %
-                                       (arch,
-
self.d.getVar('FEED_DEPLOYDIR_BASE_URI',
True),
-                                        arch))
-
-                        if self.opkg_dir != '/var/lib/opkg':
-                            # There is no command line option for this
anymore, we need to add
-                            # info_dir and status_file to config file, if
OPKGLIBDIR doesn't have
-                            # the default value of "/var/lib" as defined
in opkg:
-                            # libopkg/opkg_conf.h:#define
OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
-                            # libopkg/opkg_conf.h:#define
OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
-                            cfg_file.write("option info_dir     %s\n" %
os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
-                            cfg_file.write("option status_file  %s\n" %
os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
+        self._setup_devel_feeds()
+
+    def _setup_devel_feeds(self):
+        """
+        Allow to use package deploy directory contents as quick
devel-testing
+        feed. This creates individual feed configs for each arch subdir of
those
+        specified as compatible for the current machine.
+        NOTE: Development-helper feature, NOT a full-fledged feed.
+        """
+
+        if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI', True) or "") != "":
+            for arch in self.pkg_archs.split():
+                cfg_file_name = os.path.join(self.target_rootfs +
self.d.getVar("sysconfdir", True),
+                                       "opkg", "local-%s-feed.conf" % arch)
+
+                bb.utils.mkdirhier(os.path.dirname(cfg_file_name))
+                with open(cfg_file_name, "w+") as cfg_file:
+                    cfg_file.write("src local-%s %s/%s\n" %
+                                   (arch,
+                                    self.d.getVar('FEED_DEPLOYDIR_BASE_URI',
True),
+                                    arch))
+
+                    if self.opkg_dir != self.target_rootfs +
'/var/lib/opkg':
+                        # There is no command line option for this
anymore, we need to add
+                        # info_dir and status_file to config file, if
OPKGLIBDIR doesn't have
+                        # the default value of "/var/lib" as defined in
opkg:
+                        # libopkg/opkg_conf.h:#define
OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
+                        # libopkg/opkg_conf.h:#define
OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
+                        cfg_file.write("option info_dir     %s\n" %
os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
+                        cfg_file.write("option status_file  %s\n" %
os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
      def _create_config(self):
@@ -1702,6 +1705,8 @@ class OpkgPM(OpkgDpkgPM):
                 config_file.write("option info_dir     %s\n" %
os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
                 config_file.write("option status_file  %s\n" %
os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))

+        self._setup_devel_feeds()
+
     def insert_feeds_uris(self):
         if self.feed_uris == "":
             return
-- 
2.7.1

--001a1140b8f495f20a053b8d70da
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-size:12.8px">According to the documenta=
tion, setting FEED_DEPLOYDIR_BASE_URI should</div><div style=3D"font-size:1=
2.8px">be sufficient for setting up local feeds. This commit fixes the</div=
><div style=3D"font-size:12.8px">implementation to actually do that, even i=
f BUILD_IMAGES_FROM_FEEDS is</div><div style=3D"font-size:12.8px">not set.<=
/div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8=
px">Also fix some bugs in the old implementation:</div><div style=3D"font-s=
ize:12.8px">=C2=A0- Fetch uncompressed Packages files, because</div><div st=
yle=3D"font-size:12.8px">=C2=A0 =C2=A0&#39;bitbake package-index&#39; does =
not appear to create Packages.gz files.</div><div style=3D"font-size:12.8px=
">=C2=A0- Add missing newline after the URI so that the options don&#39;t e=
nd up on</div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0the same line.</=
div><div style=3D"font-size:12.8px">=C2=A0- Fix the check when local option=
s are necessary.</div><div style=3D"font-size:12.8px"><br></div><div style=
=3D"font-size:12.8px">Signed-off-by: Reinhard Tartler &lt;<a href=3D"mailto=
:tartler@deshaw.com" target=3D"_blank">tartler@deshaw.com</a>&gt;</div><div=
 style=3D"font-size:12.8px">---</div><div style=3D"font-size:12.8px">=C2=A0=
meta/lib/oe/package_manager.p<wbr>y | 59 +++++++++++++++++++++++-------<wbr=
>------------</div><div style=3D"font-size:12.8px">=C2=A01 file changed, 32=
 insertions(+), 27 deletions(-)</div><div style=3D"font-size:12.8px"><div>d=
iff --git a/meta/lib/oe/package_manager.<wbr>py b/meta/lib/oe/package_manag=
er.<wbr>py</div><div>index 2802254..e92bbbd 100644</div><div>--- a/meta/lib=
/oe/package_manager.<wbr>py</div><div>+++ b/meta/lib/oe/package_manager.<wb=
r>py</div><div>@@ -1649,33 +1649,36 @@ class OpkgPM(OpkgDpkgPM):</div><div>=
=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0config_file.write(&quot;src/gz %s %s\n&quot; % (feed_na=
me, feed_uri))</div><div>=C2=A0</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;&quot;&quot;</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0Allow to use package deploy directory contents as quick devel-testin=
g</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0feed. This creates i=
ndividual feed configs for each arch subdir of those</div><div>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specified as compatible for the current mach=
ine.</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: Development=
-helper feature, NOT a full-fledged feed.</div><div>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (self.d.getVar(&#39;FEED_DEPLOYDIR<wbr>_BASE_URI&#39;, =
True) or &quot;&quot;) !=3D &quot;&quot;:</div><div>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for arch in self.pkg_archs.split():</div>=
<div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cfg_file_name =3D os.path.join(self.target_rootf<wbr>s,</div><div>- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 self.d.getVar(&quot;sysconfdir&quot;, True),</div><div>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;opkg&quot;,</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;local-%s-feed.conf&quot; % arch)</div><div>-</div><div>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(cfg_file_name=
, &quot;w+&quot;) as cfg_file:</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg_file.write(&quot;sr=
c/gz local-%s %s/%s&quot; %</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (arch,</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.d.getVar(&#39;FEED_DEPLOYDIR<wbr>_BA=
SE_URI&#39;, True),</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0arch))</div><div>-</div><div>- =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.opkg=
_dir !=3D &#39;/var/lib/opkg&#39;:</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Ther=
e is no command line option for this anymore, we need to add</div><div>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0# info_dir and status_file to config file, if OPKGL=
IBDIR doesn&#39;t have</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# the default va=
lue of &quot;/var/lib&quot; as defined in opkg:</div><div>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR =C2=A0 =
=C2=A0 =C2=A0&quot;/var/lib/opkg/info&quot;</div><div>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE =C2=A0 &q=
uot;/var/lib/opkg/status&quot;</div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg_file.=
write(&quot;option info_dir =C2=A0 =C2=A0 %s\n&quot; % os.path.join(self.d.=
getVar(&#39;OP<wbr>KGLIBDIR&#39;, True), &#39;opkg&#39;, &#39;info&#39;))</=
div><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg_file.write(&quot;option status_file =
=C2=A0%s\n&quot; % os.path.join(self.d.getVar(&#39;OP<wbr>KGLIBDIR&#39;, Tr=
ue), &#39;opkg&#39;, &#39;status&#39;))</div><div>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0self._setup_devel_feeds()</div><div>+</div><div>+ =C2=A0 =C2=A0def _s=
etup_devel_feeds(self):</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;=
&quot;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0Allow to use package deploy d=
irectory contents as quick devel-testing</div><div>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0feed. This creates individual feed configs for each arch subdir of th=
ose</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0specified as compatible for the =
current machine.</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: Development-h=
elper feature, NOT a full-fledged feed.</div><div>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;&quot;&quot;</div><div>+</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (self.d.getVar(&#39;FEED_DEPLOYDIR<wbr>_BASE_URI&#39;, True) or &quot=
;&quot;) !=3D &quot;&quot;:</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0for arch in self.pkg_archs.split():</div><div>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg_file_name =3D os.path.join(self.targe=
t_rootf<wbr>s + self.d.getVar(&quot;sysconfdir&quot;, True),</div><div>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;opkg&quot=
;, &quot;local-%s-feed.conf&quot; % arch)</div><div>+</div><div>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(os.path.=
di<wbr>rname(cfg_file_name))</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0with open(cfg_file_name, &quot;w+&quot;) as cfg_file:<=
/div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cfg_file.write(&quot;src local-%s %s/%s\n&quot; %</div><div>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (arch,</div><div>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.d.getVar(&#39;FEED_DEPLOYDIR<wbr>_BA=
SE_URI&#39;, True),</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0arch))</div><div>+</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.opkg_dir !=3D self.target_rootfs=
 + &#39;/var/lib/opkg&#39;:</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# There is no command line =
option for this anymore, we need to add</div><div>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# info_dir an=
d status_file to config file, if OPKGLIBDIR doesn&#39;t have</div><div>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# the default value of &quot;/var/lib&quot; as defined in opkg:</=
div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0# libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DI=
R =C2=A0 =C2=A0 =C2=A0&quot;/var/lib/opkg/info&quot;</div><div>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# =
libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE =C2=A0 &quot;/var=
/lib/opkg/status&quot;</div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg_file.write(&quot;option in=
fo_dir =C2=A0 =C2=A0 %s\n&quot; % os.path.join(self.d.getVar(&#39;OP<wbr>KG=
LIBDIR&#39;, True), &#39;opkg&#39;, &#39;info&#39;))</div><div>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cf=
g_file.write(&quot;option status_file =C2=A0%s\n&quot; % os.path.join(self.=
d.getVar(&#39;OP<wbr>KGLIBDIR&#39;, True), &#39;opkg&#39;, &#39;status&#39;=
))</div><div>=C2=A0 =C2=A0 =C2=A0 def _create_config(self):</div><div>@@ -1=
702,6 +1705,8 @@ class OpkgPM(OpkgDpkgPM):</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_file.write(&quot;option inf=
o_dir =C2=A0 =C2=A0 %s\n&quot; % os.path.join(self.d.getVar(&#39;OP<wbr>KGL=
IBDIR&#39;, True), &#39;opkg&#39;, &#39;info&#39;))</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_file.write(&quot;op=
tion status_file =C2=A0%s\n&quot; % os.path.join(self.d.getVar(&#39;OP<wbr>=
KGLIBDIR&#39;, True), &#39;opkg&#39;, &#39;status&#39;))</div><div>=C2=A0</=
div><div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0self._setup_devel_feeds()</div><div>+=
</div><div>=C2=A0 =C2=A0 =C2=A0def insert_feeds_uris(self):</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.feed_uris =3D=3D &quot;&quot;:</div>=
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return</div><div style=
=3D"margin:2px 0px 0px"><img src=3D"https://ssl.gstatic.com/ui/v1/icons/mai=
l/images/cleardot.gif" class=3D"gmail-CToWUd"></div><div class=3D"gmail-yj6=
qo gmail-ajU" style=3D"margin:2px 0px 0px"><div id=3D"gmail-:18s" class=3D"=
gmail-ajR" tabindex=3D"0"><img class=3D"gmail-ajT" src=3D"https://ssl.gstat=
ic.com/ui/v1/icons/mail/images/cleardot.gif"></div></div><span class=3D"gma=
il-HOEnZb gmail-adL"><font color=3D"#888888"><font color=3D"#888888"><div s=
tyle=3D"font-size:12.8px">--=C2=A0</div><div style=3D"font-size:12.8px">2.7=
.1</div></font></font></span></div></div>

--001a1140b8f495f20a053b8d70da--
