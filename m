Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id DEFBC7F89C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 13:15:19 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id j42so49511824wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 05:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=edXvzyV0LMZ16lhzmz1EVkBFXt0ml4/iguBVofg5vqQ=;
	b=OQ0Kvqhle2XEBt+INX0XeBiiP619sRPYFG0djLgoK56eGpeM64uczb0+vkjENPlKzu
	G7khjV1zxXngUrZXjTReiOOJuHImkVyvi/VYAn2l6woglfUJhNNsQ7lvYp5vOzTU09D8
	herDS1oD0vyqR0bE+86vqrz1OfJfnrH81fXl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=edXvzyV0LMZ16lhzmz1EVkBFXt0ml4/iguBVofg5vqQ=;
	b=Ik1OWE3C11Intbk8cRufDEdOSjWBzNwMlIbbQD+2QOHS0qqpkA/9al0jP4dRqrVHgd
	TTl/SjfFTmxX8+J3kubN/KEndgpFF1jsfY5CcZhDIGnOCb2+IQAK65LdPovcyNH1k9aY
	KJNsu4nVSGfLF5FYLjb3tKPx4CjoYBZhvlexPsTt+oSLvocJ0hxn4UvxZg93IzRE2iTs
	+loo1+EQlzSGKAItBo3uxnKsiSkDOXjrQjTbxUKVDzAs7anvf1xA2AULTFxbKUh933n3
	ZDZ6g2W07MHOsSk8oMz0p0aZnqj2HBONXMwDOZWMVVzOKCk2LPWvjNmnhqobPwpx17fQ
	z1Yw==
X-Gm-Message-State: APjAAAUA6Oryz5Vbs40ecrLcjby+70r3MCWSxouwniEVVdpggyKeNypp
	3fAc8DRskNCnPBQFtQKalx/n9W7RKkk=
X-Google-Smtp-Source: APXvYqy11eO22Br5oUdeTlGe6EMCTmDpPKDUxWf08dywRuVOyMoEKDeqIBT0DjwJvWS0yVlBq+8qNg==
X-Received: by 2002:adf:9b83:: with SMTP id d3mr102504287wrc.54.1578316520210; 
	Mon, 06 Jan 2020 05:15:20 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o15sm73629570wra.83.2020.01.06.05.15.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 05:15:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 13:15:15 +0000
Message-Id: <20200106131516.6507-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] sstate: Avoid races over rewritten siginfo files
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
X-List-Received-Date: Mon, 06 Jan 2020 13:15:20 -0000
Content-Transfer-Encoding: 8bit

Try and avoid errors like:

Exception: bb.process.ExecutionError: Execution of 'build/tmp/work/x86_64-linux/libxslt-native/1.1.34-r0/temp/run.sstate_unpack_package.12343' failed with exit code 1:
touch: setting times of 'build/sstate_devtool/80/4d/sstate:libxslt-native::1.1.34:r0::3:804d33f3f8d032b01ae92207669dd0a8f95a84917d563d122a77df19e786d73c_populate_lic.tgz.siginfo': Stale file handle
WARNING: exit code 1 from a shell command.

by not overwriting existing files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 241dace6d9a..356fe7ec180 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -686,7 +686,11 @@ def sstate_package(ss, d):
         bb.build.exec_func(f, d, (sstatebuild,))
 
     # SSTATE_PKG may have been changed by sstate_report_unihash
-    bb.siggen.dump_this_task(d.getVar('SSTATE_PKG') + ".siginfo", d)
+    siginfo = d.getVar('SSTATE_PKG') + ".siginfo"
+    if not os.path.exists(siginfo):
+        bb.siggen.dump_this_task(siginfo, d)
+    else:
+        os.utime(siginfo, None)
 
     return
 
@@ -1110,8 +1114,11 @@ python sstate_eventhandler() {
             d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
             d.setVar("SSTATE_EXTRAPATH", "")
         d.setVar("SSTATE_CURRTASK", taskname)
-        sstatepkg = d.getVar('SSTATE_PKG')
-        bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)
+        siginfo = d.getVar('SSTATE_PKG') + ".siginfo"
+        if not os.path.exists(siginfo):
+            bb.siggen.dump_this_task(siginfo, d)
+        else:
+            os.utime(siginfo, None)
 }
 
 SSTATE_PRUNE_OBSOLETEWORKDIR ?= "1"
-- 
2.20.1


