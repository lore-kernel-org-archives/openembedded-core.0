Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8436BC9EC8B
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 13:25:43 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32778.1768224342370888082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 05:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JlV2vfp8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso58618075e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 05:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768224340; x=1768829140; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ehplA4By8rukUs7KnxO1eHeaQALBkSc0UZ3La7hNDqE=;
        b=JlV2vfp8PtT9Y/jyn1HAhHEjaCXjpbJwTuVYBUcTmTS46bVPdCURk63WPkvigdGr+9
         MizDdePDyI+MQn1QhmRDbv5WHYP4qn+2U8npznQHTGp1IXwE0UN8/Tk2a718zxqGrCA6
         HE1IVSy2f5K7KdKoQLiI1aqTKhZ+jZq1ieuuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768224340; x=1768829140;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ehplA4By8rukUs7KnxO1eHeaQALBkSc0UZ3La7hNDqE=;
        b=S+Vpz4Y2SPKL+NlSm41WUW6codLMx058O0rsjtMrgIjQA8OBuc/sILvwntYM0wXLKh
         Px7UZ5AEVqmjOvno3xRfzC2G5yjbzle6zha3YdZJgKFIev+HHPEkFknb+fIcjQAXhZtP
         LLSFhWq9L30TMY6+r+dSLRDyW0I8wuPYWh0Vl65xJrM3z8SYWsz99Xjc8oxBxRoi9Mdc
         ZU8lCz16L+40UxAma9kjLtOb6SqqYETgYqRAciq4K8mmOl6RhWbzbX4piLgTzs3bSTLH
         tsbFTVhKfSMU6OiBcOZvJYcNvzZAtiP2Pv4fPTYQfdkefiadWp4EjsvSxzK8MlQmU5m9
         pBBw==
X-Gm-Message-State: AOJu0YyiBsIqXg17Fu6GEbV6kDYoY48yO/m/UEW2yL98sD0V66nuffwa
	9d6KY2XJX5jW/E4PHEqe04c+WmUt7xSGldxqnHDBWrWKBrqSsHy6SuKZ3Sc3m4rw1MH5eAl7/On
	5FDDNW4g=
X-Gm-Gg: AY/fxX7s96EEHJOsnXi21yJtwqZypHOID+cn/VdUtgg+G5AR5egVX/XhDUsM7jWOTjp
	Upil6rBerFx+g3Fh1FWDFsXwwhNqUdmmPusfMP0/fzpAYAM0qltE8tmEnCYg2xwXY6uOv8sO+Wl
	sO5411SRw9aFeNOFipgVo/Siy3p/7wVP7g4lBKfBXK0WJzIMJvLqgMf48cvnhflQbA0P/3Pvk1w
	U5hvZ3YIo42C1wpSey3wCaBTJS7MLRnzydBeqO7dlz+uNw6NRpibtCY0L925DU00XKtAnIN5UXC
	Lmsqjk71Lm0tiLidoCx7ZAq9WmYyMgfAoE/jiP6kt8/GK8xHtq0nAMxUPoqm7nK3CRITF+Nl62w
	/8Uz1npdAooy7iIbh2uH3zhv7gQZuXxPifCpz3j35loeSV+6o9yNtP5BKOkGK62QT4QkFLx3LuE
	CZCHT5f9RKc35RI3OcnK0PHGmJ2Lby1R9wZgEAfTSfwSHjxo1zl8zgDa1s9eQHbWnmYXbNhccWM
	CPjEouwV2A=
X-Google-Smtp-Source: AGHT+IHIi0TqWtBz0U9iANTaXRLIpckGlJlKur96Kj+BBZhPfEBuorTLuKUMs3cGlO4QoEWbsmmPkg==
X-Received: by 2002:a05:600c:500d:b0:477:9d54:58d7 with SMTP id 5b1f17b1804b1-47d84b3b881mr161979555e9.29.1768224340053;
        Mon, 12 Jan 2026 05:25:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:895a:892d:9c2:ba5a? ([2001:8b0:aba:5f3c:895a:892d:9c2:ba5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8662ffaasm130297745e9.6.2026.01.12.05.25.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 05:25:39 -0800 (PST)
Message-ID: <9e53dc57138793a68602ad8987ba6169ded9d0a8.camel@linuxfoundation.org>
Subject: Notes on how I've been debugging the glibc system mode test hang so
 far
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Jan 2026 13:25:38 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 13:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229209

I thought I should write down how I'm narrowing down the glibc issue
and making it easier to debug.

We're talking about the glibc system mode testing, where a qemu VM is
started, unfs3 is used to NFS mount $WORKDIR into the VM and then the
glibc test suite is run in that environment.

The command to run just this test is:

oe-selftest -r glibc.GlibcSelfTestSystemEmulated -j 1 -K

The -j option means it creates a new build directory each time and the
-K ensures it is kept.

You can find the guest VM with ps ax | grep qemu-system-. You can then
access it with something like ssh root@192.168.7.2

We needed some way to identify when things were broken/hanging. That
appears to be that unfsd has exited and is in a zombie state. I did
some horrible hacking of the command execution code in
meta/lib/oeqa/utils/commands.py adding:

    def logit(self, msg):
        with open("/tmp/rp.cmd.%s" % os.getpid(), "a+") as f:
            f.write(msg + "\n")

Adding things like:

+        self.logit("Command '%s' returned %d as exit code." % (self.cmd, s=
elf.status))

+            self.logit("Last 20 lines:\n%s" % lout)
             self.log.debug("Last 20 lines:\n%s" % lout)
=20

Which let me see the buffer overflow message from unfsd. This code
ensures the data isn't stuck in some pipe buffer we never see by
writing it out directly when it happens.

Now, with an idea of what breaks, we needed a faster reproducer as the
tests hang after about 4.5 hours, which isn't good for debugging.

In the end, I wrote a script like this:

while true
do
    date
    tail log.do_check.* -n 4
    ps ax | grep unfs | grep -v grep
    sleep 2
done

which monitored the log file and logged the lines there along with the
time and the status of the unfs process. Left running for a while, this
narrowed down the issue to being triggered by the misc/test-syslog
test.

I then worked out how to run individual tests in the glibc test suite
(make test t=3Dmisc/tst-syslog) and then hacked that into the glibc-
testsuite recipe:
=20
+    tar -xf ${COREBASE}/meta/recipes-core/glibc/glibc/test.tgz -C ${B}/
+
     oe_runmake -i \
         GPROF=3D"${TARGET_PREFIX}gprof" \
         QEMU_SYSROOT=3D"${RECIPE_SYSROOT}" \
@@ -28,7 +30,9 @@ do_check:append () {
         SSH_HOST_USER=3D"${TOOLCHAIN_TEST_HOST_USER}" \
         SSH_HOST_PORT=3D"${TOOLCHAIN_TEST_HOST_PORT}" \
         test-wrapper=3D"${UNPACKDIR}/check-test-wrapper ${TOOLCHAIN_TEST_T=
ARGET}" \
-        check
+        test t=3Dmisc/tst-syslog
+
+    sleep 10000

The tarball creates some needed files in the test directory
(testroot.pristine and testroot.root), not sure how to create those
with a make command as yet, I just ahacked around it with a tarball.

With those changes, the oe-selftest hangs much faster. It still has an
image build and lots of compiling in glibc but is nowhere near 4.5
hours how.

Next, I can likely extract much of this from the test into a manual
environment to avoid the image creation overhead each time.

Obvoiously I've not started debugging the overflow itself yet but I can
now trigger the issue in a much faster way.

Cheers,

Richard





