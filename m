Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C60C47DDB
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 14:47:57 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.19836.1706626073920019151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 06:47:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lW/O5oAj;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50eac018059so4712833e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 06:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706626072; x=1707230872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HpPR7u+BrHf7Pa9kWrzclq873ZihlgHyqdAswddjpec=;
        b=lW/O5oAjjLp0vADwfQhYKeRlwKeIns23z5bkbW/OBrcS5skmjGJlggEBaKwd0iYfqj
         iPob35UweIA5oOU+kTC9FaDS2x7SXuf/E83Q8a4DxnVIEd6E2DvIGFB3c//Sk33a/Ewj
         0yaonD2LZyqqVZPs+xhHQN5dEZhGWmUBi4igEUGZ5h+7m2bZlIjkyPc2TChWIfQZKmXb
         eCO0rRkEqruBx0X94yc8CiSFjAs8pC8cHbot5L2zACk3+sG7V+0/mx8N70UlNu5fljHm
         QODriL8vMXvqVIYBGjyjq7ksKd34vUpY04RuGv7zEJMarSQkDNrjf/WsJCLSV/vBjL97
         B4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706626072; x=1707230872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpPR7u+BrHf7Pa9kWrzclq873ZihlgHyqdAswddjpec=;
        b=LIiwKiNAqm6vbfBDwrFJj+DMCT1qfLMKtYRXlFxg8XicV4OhOiC/367DN9DY33Y1gV
         M1SCb3/AhXJFicthjTiHmOIOLQGImzwwpZF2vsq5Ig0Xj5z81jwtzjtIbZbeXBWBgAzv
         f+bniKlVYQjtsCKj4iKz9+OjgGUa+OJ1PNhvRX9Mnh1jqJLpGinR5bTjwR9JwlkVYSxj
         JL6dFhvYof+H4+VIuwazDaWNndCCaheNzJkqpXxX7aNOj6meaEhSf/RhPSgXvunxzfbI
         aj/iuvoGrgGv9ckwLA8Kugkut4bH9xSKH1OoE4I+VF/DM4NHcDZmUik19ca+97k7DZpW
         77dA==
X-Gm-Message-State: AOJu0YwtxNwahMNGBAxd83gb4LJvdbFytU4ZMz2xfJhRHtwUHDk0Th+R
	CxSOScfUvzfgOrDv4+hj9fbgwwFDE5QMf3uK7jAk2NzPQ/jXmscBeggbBqMk
X-Google-Smtp-Source: AGHT+IG1YZ2FcLk4igRmJdjoIIOgwKP7+pIioc/OyaIcY2myHNLWfooRR919vXEb+3skAxi64hMZUA==
X-Received: by 2002:a05:6512:48b:b0:510:ee2d:46fd with SMTP id v11-20020a056512048b00b00510ee2d46fdmr5008363lfq.51.1706626071772;
        Tue, 30 Jan 2024 06:47:51 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id vh5-20020a170907d38500b00a3517d26918sm4651325ejc.107.2024.01.30.06.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 06:47:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] qemu: fix target build with ccache enabled
Date: Tue, 30 Jan 2024 15:47:48 +0100
Message-ID: <20240130144748.3378823-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 14:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194494

* with ccache inheritted, the BUILD_CC is 'ccache gcc', but because of missing
  quote it ends passing just ccache to host-cc which gets stripped and then
  it calls compiler[0] on empty compiler variable and breaks meson as shown in:
  http://errors.yoctoproject.org/Errors/Details/751436/

python version: Python 3.12.1
Traceback (most recent call last):
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/mesonmain.py", line 194, in run
    return options.run_func(options)
           ^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/msetup.py", line 358, in run
    app.generate()
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/msetup.py", line 181, in generate
    return self._generate(env, capture, vslite_ctx)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/msetup.py", line 203, in _generate
    intr = interpreter.Interpreter(b, user_defined_options=user_defined_options)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/interpreter/interpreter.py", line 331, in __init__
    self.parse_project()
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/interpreterbase/interpreterbase.py", line 132, in parse_project
    self.evaluate_codeblock(self.ast, end=1)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/interpreterbase/interpreterbase.py", line 198, in evaluate_codeblock
    raise e
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/interpreterbase/interpreterbase.py", line 190, in evaluate_codeblock
    self.evaluate_statement(cur)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/interpreterbase/interpreterbase.py", line 204, in evaluate_statement
    return self.function_call(cur)
           ^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/interpreterbase/interpreterbase.py", line 530, in function_call
    res = func(node, func_args, kwargs)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/interpreterbase/decorators.py", line 260, in wrapper
    return f(*nargs, **wrapped_kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/interpreterbase/decorators.py", line 579, in wrapper
    return f(*wrapped_args, **wrapped_kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/interpreter/interpreter.py", line 1309, in func_project
    self.add_languages(proj_langs, False, MachineChoice.BUILD)
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/interpreter/interpreter.py", line 1476, in add_languages
    success = self.add_languages_for(args, required, for_machine)
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/interpreter/interpreter.py", line 1519, in add_languages_for
    comp = compilers.detect_compiler_for(self.environment, lang, for_machine, skip_sanity_check)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/compilers/detect.py", line 115, in detect_compiler_for
    comp = compiler_from_language(env, lang, for_machine)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/compilers/detect.py", line 112, in compiler_from_language
    return lang_map[lang](env, for_machine) if lang in lang_map else None
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/compilers/detect.py", line 614, in detect_c_compiler
    return _detect_c_or_cpp_compiler(env, 'c', for_machine)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/mesonbuild/compilers/detect.py", line 286, in _detect_c_or_cpp_compiler
    compiler_name = os.path.basename(compiler[0])
                                     ~~~~~~~~^^^
IndexError: list index out of range

...

Project name: qemu
Project version: 8.2.0
C compiler for the host machine: ccache x86_64-oe-linux-clang -target x86_64-oe-linux -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -mlittle-endian --dyld-prefix=/usr -Qunused-arguments --sysroot=TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot -m64 -mcx16 (clang 17.0.6 "clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)")
C linker for the host machine: x86_64-oe-linux-clang -target x86_64-oe-linux -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -mlittle-endian --dyld-prefix=/usr -Qunused-arguments --sysroot=TOPDIR/tmp-glibc/work/core2-64-oe-linux/qemu/8.2.0/recipe-sysroot -m64 -mcx16 ld.lld 17.0.6

../qemu-8.2.0/meson.build:1:0: ERROR: Unhandled python exception

    This is a Meson bug and should be reported!

ERROR: meson setup failed

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 0cced6ed32..bc6ce0bb38 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -114,7 +114,7 @@ EXTRA_OECONF = " \
     --extra-ldflags='${LDFLAGS}' \
     --disable-download \
     --disable-docs \
-    --host-cc=${BUILD_CC} \
+    --host-cc='${BUILD_CC}' \
     ${PACKAGECONFIG_CONFARGS} \
     "
 
-- 
2.43.0


