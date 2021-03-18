Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com [136.143.188.16])
 by mx.groups.io with SMTP id smtpd.web10.9583.1616077400237062386
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 07:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=EmTMIh1U;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.16, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1616077395; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CB3ilPKVzRnh+k0gaUXm8TW9COqKgyrO9qLibdW8YfCYxO/m3XfFJl83+GFmMZ79pwuXNsIoqSXChEoNE6XDpmHRGdPmrcO2xbH5RhRUywOIzVl8lVcKYL4G3uTXvJE0iS7oNqNNLsf13vs8H78el2vx8C42DPIilxhHxMvuv50=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1616077395; h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=b9/Cb4QJHXhcGHGK4YllKBJp1Hlo+i+8X+poEGcXQQk=; 
	b=mvw/tdW8P6DFKjxLNp3f46Y+cK2Z/XpougQ0WIRGlc9ZXTMZBBMSN1xc/HmJoIBpBO0AY/XSJrnq5hgqmtuLD7YiZNFFtjqdrVlLBqO+pBEWxFLrf1ILUujOvus+ntx2tleoXhgyN5TLnRHdTI9k3HsTq73nW30nlj6QmqZiOOI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl> header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616077395;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=b9/Cb4QJHXhcGHGK4YllKBJp1Hlo+i+8X+poEGcXQQk=;
	b=EmTMIh1U7YJ2lxPdewxwYUdgBeQVQcfCONoUPhnzULoqbJeMqCj9TOOBOXdbvQf9
	O4+zET8wwvw1YAJNoCEZ/TeJRQt3cpHERnh8e1QlHhVBS23qmNZdY1lqQXccDbK8Lxk
	92Mp+ZftxBSrAsy60FIgO270v1awnsG0iRj0IDxE=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 16160773910511014.7596148268759; Thu, 18 Mar 2021 07:23:11 -0700 (PDT)
Date: Thu, 18 Mar 2021 15:23:10 +0100
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: "openembedded-core" <openembedded-core@lists.openembedded.org>
Message-ID: <17845b8040c.d366bfc510803.2986508994038431829@ertelnet.rybnik.pl>
In-Reply-To: 
Subject: [PATCH] base.bbclass: Honor PATH when selecting hosttools
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Honors the PATH[1] and other user settings like
system wide ccache when selecting hosttools.

Fixes the following compilation error when compiling clang-11:

 | CMake Error at cmake/modules/CheckCompilerVersion.cmake:38 (message):
 |   Host GCC version must be at least 5.1, your version is 4.8.5.
 | Call Stack (most recent call first):
 |   cmake/modules/CheckCompilerVersion.cmake:48 (check_compiler_version)

on CentOS which by default has the gcc 4.8.5. However, this machine
has configured the gcc-7 from Developer Toolset[2] as a default one:

 $ gcc --version | head -n1
 gcc (GCC) 7.3.1 20180303 (Red Hat 7.3.1-5)

 $ which gcc
 /opt/rh/devtoolset-7/root/usr/bin/gcc

So far, I did not find any other software which would not respect
this setup.

This will also start honoring system-wide ccache configuration
(e.g. widely used on Fedora Linux) where the gcc is used from
the non-standard following location:

 $ which gcc
 /usr/lib64/ccache/gcc

once the user decided to install ccache package:

 $ rpm -qf /usr/lib64/ccache/gcc
 ccache-4.2-1.fc33.x86_64

[1] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_09_01_01
[2] https://www.softwarecollections.org/en/scls/rhscl/devtoolset-7/

Signed-off-by: Damian Wrobel <dwrobel@ertelnet.rybnik.pl>
---
 meta/classes/base.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b4160402f0..67b0fa1497 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -131,12 +131,6 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
             if os.path.islink(desttool):
                 os.unlink(desttool)
             srctool = bb.utils.which(path, tool, executable=True)
-            # gcc/g++ may link to ccache on some hosts, e.g.,
-            # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then which(gcc)
-            # would return /usr/local/bin/ccache/gcc, but what we need is
-            # /usr/bin/gcc, this code can check and fix that.
-            if "ccache" in srctool:
-                srctool = bb.utils.which(path, tool, executable=True, direction=1)
             if srctool:
                 os.symlink(srctool, desttool)
             else:
-- 
2.26.2

