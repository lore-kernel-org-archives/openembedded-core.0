Received: from esa1.bmw.c3s2.iphmx.com (esa1.bmw.c3s2.iphmx.com [68.232.133.201])
 by mx.groups.io with SMTP id smtpd.web10.27833.1590392645984711565
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 00:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=qO8/x70s;
 spf=pass (domain: bmw.de, ip: 68.232.133.201, mailfrom: prvs=40745be84=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1590392646; x=1621928646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=jD3zME2ploBWmjzrlKVKNXvgA2ZlbC71OxAz/i/cxFE=;
  b=qO8/x70sLkLTm9iGLqbJJlHd+S+YMq5otBj11w238+l/iSqHIuRv8xd3
   cVvhi38aL7DeoK2XYcicTatd8lA6QXh4W5SVYP9CDnL/xb8O+epO0gDN8
   bQxkgpTD6cBH/eDzCR/UYr+TDN8fZ+rULgyarLHcL3ckUlO7jwpOuSdXv
   I=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa1.bmw.c3s2.iphmx.com with ESMTP/TLS; 25 May 2020 09:44:03 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw4.muc with ESMTP/TLS;
 25 May 2020 09:44:01 +0200
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp) ([160.48.96.43])
 by esabb4.muc with ESMTP/TLS; 25 May 2020 09:43:59 +0200
Received: from michael-pcx.bmw-carit.intra (192.168.221.35) by
 smucm09k.europe.bmw.corp (160.48.96.43) with Microsoft SMTP Server (TLS;
 Mon, 25 May 2020 09:43:59 +0200
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Michael Ho <Michael.Ho@bmw.de>
Subject: [PATCH 5/5] ref-manual: add PACKAGE_ADD_METADATA documentation
Date: Mon, 25 May 2020 09:43:41 +0200
Message-ID: <1590392621-327991-5-git-send-email-michael.ho@bmw.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590392621-327991-1-git-send-email-michael.ho@bmw.de>
References: <1590392621-327991-1-git-send-email-michael.ho@bmw.de>
MIME-Version: 1.0
Return-Path: michael.ho@bmw.de
X-ClientProxiedBy: smucm06j.europe.bmw.corp (160.48.96.30) To
 smucm09k.europe.bmw.corp (160.48.96.43)
Content-Type: text/plain

From: Michael Ho <Michael.Ho@bmw.de>

Add a basic variable definition and a small section to the development
tasks manual for using PACKAGE_ADD_METADATA to add custom metadata to
packages.

Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
---
 .../dev-manual/dev-manual-common-tasks.xml         | 58 ++++++++++++++++++++++
 documentation/ref-manual/ref-variables.xml         | 34 +++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index e9ce182..605d1ad 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -9057,6 +9057,9 @@
                 <listitem><para>
                     <link linkend='creating-node-package-manager-npm-packages'>Creating node package manager (NPM) packages</link>
                     </para></listitem>
+                <listitem><para>
+                    <link linkend='adding-custom-metadata-to-packages'>Adding custom metadata to packages</link>
+                    </para></listitem>
             </itemizedlist>
         </para>
 
@@ -10761,6 +10764,61 @@
                 </para>
             </section>
         </section>
+
+        <section id='adding-custom-metadata-to-packages'>
+            <title>Adding custom metadata to packages</title>
+
+            <para>
+                The variable <ulink url='&YOCTO_DOCS_REF_URL;#var-PACKAGE_ADD_METADATA'><filename>PACKAGE_ADD_METADATA</filename></ulink>
+                can be used to add additional metadata to packages. This is
+                reflected in the package control/spec file. To take the ipk
+                format for example, the CONTROL file stored inside would
+                contain the additional metadata as additional lines.
+            </para>
+
+            <para>
+                The variable can be used in multiple ways, including using
+                suffixes to set it for a specific package type and/or package.
+                Note that the order of precedence is the same as this list:
+                <itemizedlist>
+                    <listitem><para>
+                        <filename>PACKAGE_ADD_METADATA_&lt;PKGTYPE&gt;_&lt;PN&gt;</filename>
+                    </para></listitem>
+                    <listitem><para>
+                        <filename>PACKAGE_ADD_METADATA_&lt;PKGTYPE&gt;</filename>
+                    </para></listitem>
+                    <listitem><para>
+                        <filename>PACKAGE_ADD_METADATA_&lt;PN&gt;</filename>
+                    </para></listitem>
+                    <listitem><para>
+                        <filename>PACKAGE_ADD_METADATA</filename>
+                    </para></listitem>
+                </itemizedlist>
+                &lt;PKGTYPE&gt; is a parameter and expected to be a
+                distinct name of specific package type:
+                <itemizedlist>
+                    <listitem><para>IPK for .ipk packages</para></listitem>
+                    <listitem><para>DEB for .deb packages</para></listitem>
+                    <listitem><para>RPM for .rpm packages</para></listitem>
+                </itemizedlist>
+                &lt;PN&gt; is a parameter and expected to be a package name.
+            </para>
+
+            <para>
+                The variable can contain multiple [one-line] metadata fields
+                separated by the literal sequence '\n'. The separator can be
+                redefined using the variable flag <filename>separator</filename>.
+            </para>
+
+            <para>
+                The following is an example that adds two custom fields for
+                ipk packages:
+                <literallayout class='monospaced'>
+    PACKAGE_ADD_METADATA_IPK = "Vendor: CustomIpk\nGroup: Applications/Spreadsheets"
+                </literallayout>
+            </para>
+        </section>
+
     </section>
 
     <section id='efficiently-fetching-source-files-during-a-build'>
diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 364cd09..657f6cf 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -9539,6 +9539,40 @@
             </glossdef>
         </glossentry>
 
+        <glossentry id='var-PACKAGE_ADD_METADATA'><glossterm>PACKAGE_ADD_METADATA</glossterm>
+            <info>
+                PACKAGE_ADD_METADATA[doc] = "This variable defines additional metadata to add to packages."
+            </info>
+            <glossdef>
+                <para role="glossdeffirst">
+<!--                <para role="glossdeffirst"><imagedata fileref="figures/define-generic.png" /> -->
+                    This variable defines additional metdata to add to packages.
+                </para>
+
+                <para>
+                    You may find you need to inject additional metadata into
+                    packages. This variable allows you to do that by setting
+                    the injected data as the value. Multiple fields can be
+                    added by splitting the content with the literal separator
+                    "\n".
+                </para>
+
+                <para>
+                    The suffixes '_IPK', '_DEB', or '_RPM' can be applied to
+                    the variable to do package type specific settings. It can
+                    also be made package specific by using the package name as
+                    a suffix.
+                </para>
+
+                <para>
+                    You can find out more about applying this variable in
+                    the
+                    "<ulink url='&YOCTO_DOCS_DEV_URL;#adding-custom-metadata-to-packages'>Adding custom metadata to packages</ulink>"
+                    section in the Yocto Project Development Tasks Manual.
+                </para>
+            </glossdef>
+        </glossentry>
+
         <glossentry id='var-PACKAGE_ARCH'><glossterm>PACKAGE_ARCH</glossterm>
             <info>
                 PACKAGE_ARCH[doc] = "The architecture of the resulting package or packages."
-- 
2.7.4

