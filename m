Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1A42E6B513
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:46 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 193so1845235pfc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mnA0z46QvUXAcVt6oX6zMmzVrKCmSf7kX7DL+TJlo1M=;
	b=hO4F2eMdP+8zQgxeyZPBXFKVDdlJh7uoSgPgCTZyegd7Sh4XR7hRbnudpCWlv5YXlv
	cTB1sHno6UzixyMmhAiTXMeuXYeQQLeT0AmcoFfdJuhlsJd1OBHIEj8wB9ICcg+N0YUl
	S7m5a7/yHtUVtA3Jgf2J7eVSaWWTbCPMaPr/+NDwh9BmGGxRKIq/JxoUPEDBu9r0CLVK
	VoxarnyJ5YKKyHCaZeJgcew1VPPwjScqeDjIYr43K7NqNxbq4Nco57O5fjRt9BnSZ4Ox
	eEYiBAqJy9wnLmbH7wMGkeBSiNwDnbJUKpkNfFZZty6IKMGjmYom+Uir5YyMUuXyJKtV
	7D2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mnA0z46QvUXAcVt6oX6zMmzVrKCmSf7kX7DL+TJlo1M=;
	b=GttGF/n+22du80zH1qPG1S+Og1o4i2rjwpHaytMfLg3OeJ/X/lERMlN5lRd8MG49Rj
	9qa1XSz6jYOs5KkwD2pGkn0+apcol1ZYQsR59jxqG2RKy2CSQ2+WJLHgp1QQSQJYHy/k
	AVFjhDRjLV0FAzCPc8h4g0O/PEyCbDLG1MmDSasKiNdbrkyQMw0KxQ1w2R8HZryu/ic0
	DrLw5WDYCuazlotMMmtQaXRgqkUgkjlTU+/GBsZs9XVrGNIG9v+3YE4NJqN+ksiMoQHx
	irRu0mp0PdwZbIwx+e+Kvv9XZ2AUCuTbiT+xAJBMPQ9uuLjDcaMSa8rKktiXFC9RAuLL
	dykQ==
X-Gm-Message-State: APjAAAU4iEahCQlm2WpgagrJ5j6Lxw9OI/Ed2TJASQME30UNpAujWoe+
	BvzI3brwj/v33ClYowD7z2TAKit3
X-Google-Smtp-Source: APXvYqxZaNNjhZc9fMjwJPwGklftL9EoKgwOc4l02IVDADaigoNKvpD1iWz/EK7QMBGnOTOycqe+9w==
X-Received: by 2002:a62:7dd2:: with SMTP id y201mr5192270pfc.90.1573658387003; 
	Wed, 13 Nov 2019 07:19:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:19:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:04 -0800
Message-Id: <1913e688ad95d465e9b9d16ad57f2bdef2b50d93.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 01/25] meson: Backport patch to handle strings in cross file args
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
X-List-Received-Date: Wed, 13 Nov 2019 15:19:46 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This allows <language>_args and <language>_link_args properties, e.g.,
c_link_args, in meson.cross to be specified as either a string or a
list.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc              |  1 +
 ...e-strings-in-cross-file-args.-Closes-4671.patch | 87 ++++++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-Handle-strings-in-cross-file-args.-Closes-4671.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index bfe9851..ef26848 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -17,6 +17,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://many-cross.patch \
            file://cross-libdir.patch \
            file://0001-Fix-missing-return-statements-that-are-seen-with-Wer.patch \
+           file://0001-Handle-strings-in-cross-file-args.-Closes-4671.patch \
            "
 SRC_URI[sha256sum] = "ef9f14326ec1e30d3ba1a26df0f92826ede5a79255ad723af78a2691c37109fd"
 SRC_URI[md5sum] = "0267b0871266056184c484792572c682"
diff --git a/meta/recipes-devtools/meson/meson/0001-Handle-strings-in-cross-file-args.-Closes-4671.patch b/meta/recipes-devtools/meson/meson/0001-Handle-strings-in-cross-file-args.-Closes-4671.patch
new file mode 100644
index 0000000..1b1668e
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-Handle-strings-in-cross-file-args.-Closes-4671.patch
@@ -0,0 +1,87 @@
+From 4818b27894c828a50befc94f1bc9062e89a544ea Mon Sep 17 00:00:00 2001
+From: Jussi Pakkanen <jpakkane@gmail.com>
+Date: Sat, 29 Dec 2018 18:23:36 +0200
+Subject: [PATCH] Handle strings in cross file args. Closes #4671.
+
+Upstream-Status: Backport [6c76ac80173bdc40d35e2d6b802f7950646781dc]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+
+---
+
+Note that the change to ninjabackend.py does not come from commit
+6c76ac80, as it was not corrected until commit 2b22576f. However,
+since that commit is huge and changes a lot of unrelated stuff, it was
+easier to include the relevant part here.
+
+ cross/ubuntu-armhf.txt                       |  2 +-
+ mesonbuild/backend/ninjabackend.py           |  2 +-
+ mesonbuild/compilers/compilers.py            |  4 ++--
+ test cases/common/137 get define/meson.build | 12 +++---------
+ 4 files changed, 7 insertions(+), 13 deletions(-)
+
+diff --git a/cross/ubuntu-armhf.txt b/cross/ubuntu-armhf.txt
+index fec8ce7..a6e1f15 100644
+--- a/cross/ubuntu-armhf.txt
++++ b/cross/ubuntu-armhf.txt
+@@ -12,7 +12,7 @@ pkgconfig = '/usr/bin/arm-linux-gnueabihf-pkg-config'
+ root = '/usr/arm-linux-gnueabihf'
+ # Used in unit test '140 get define'
+ c_args = ['-DMESON_TEST_ISSUE_1665=1']
+-cpp_args = ['-DMESON_TEST_ISSUE_1665=1']
++cpp_args = '-DMESON_TEST_ISSUE_1665=1'
+ 
+ has_function_printf = true
+ has_function_hfkerhisadf = false
+diff --git a/mesonbuild/backend/ninjabackend.py b/mesonbuild/backend/ninjabackend.py
+index 3739c0a..2cebeef 100644
+--- a/mesonbuild/backend/ninjabackend.py
++++ b/mesonbuild/backend/ninjabackend.py
+@@ -1400,7 +1400,7 @@ int dummy;
+                 if is_cross:
+                     crstr = '_CROSS'
+                     try:
+-                        cross_args = self.environment.cross_info.config['properties'][langname + '_link_args']
++                        cross_args = mesonlib.stringlistify(self.environment.cross_info.config['properties'][langname + '_link_args'])
+                     except KeyError:
+                         pass
+                 rule = 'rule %s%s_LINKER\n' % (langname, crstr)
+diff --git a/mesonbuild/compilers/compilers.py b/mesonbuild/compilers/compilers.py
+index e27ae2b..a5b9e91 100644
+--- a/mesonbuild/compilers/compilers.py
++++ b/mesonbuild/compilers/compilers.py
+@@ -1048,10 +1048,10 @@ class Compiler:
+             if 'properties' in environment.cross_info.config:
+                 props = environment.cross_info.config['properties']
+                 lang_args_key = self.language + '_args'
+-                extra_flags += props.get(lang_args_key, [])
++                extra_flags += mesonlib.stringlistify(props.get(lang_args_key, []))
+                 lang_link_args_key = self.language + '_link_args'
+                 if link:
+-                    extra_flags += props.get(lang_link_args_key, [])
++                    extra_flags += mesonlib.stringlistify(props.get(lang_link_args_key, []))
+         return extra_flags
+ 
+     def _get_compile_output(self, dirname, mode):
+diff --git a/test cases/common/137 get define/meson.build b/test cases/common/137 get define/meson.build
+index 109f628..1647e22 100644
+--- a/test cases/common/137 get define/meson.build	
++++ b/test cases/common/137 get define/meson.build	
+@@ -67,15 +67,9 @@ foreach lang : ['c', 'cpp']
+ 
+   run_1665_test = false
+   if meson.is_cross_build()
+-    # Can't use an empty array as a fallback here because of
+-    # https://github.com/mesonbuild/meson/issues/1481
+-    lang_args = meson.get_cross_property(lang + '_args', [])
+-    if lang_args.length() != 0
+-      foreach lang_arg : lang_args
+-        if lang_arg.contains('MESON_TEST_ISSUE_1665')
+-          run_1665_test = true
+-        endif
+-      endforeach
++    lang_arg = meson.get_cross_property(lang + '_args', '')
++    if lang_arg == '-DMESON_TEST_ISSUE_1665=1'
++      run_1665_test = true
+     endif
+   endif
+ 
-- 
2.7.4


