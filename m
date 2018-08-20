Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by mail.openembedded.org (Postfix) with ESMTP id 38C947918A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 10:06:16 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id v22-v6so10461517lfe.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 03:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=KdnvKlAdt9jBUnhQ3OY+KijSXCnOUs8goW7ZFvI127c=;
	b=T0mn9P2tjBX0G5P7pjwEN5wuqr6CnOB67Z7TQFHshI91fMjAxE0+IDYZThp/jL0gvo
	79agky24FvkQYxWYv5cRDTC6JVuBU5lx3K5KN1lI7Zd2Z+2jXBssvTfuOVP/jjWD0BjF
	rG+dbjFJgPRr83Ta14xjR9L7CtLtZTHAhZQzoaxINUX2lGDEeKrusOQWcgl1bm72/AzX
	b6oPoSLDqkgeLqS4mJDs0fAopeFJOuLXDq15ixz++oKY5Vqbi38EZsV8ZuVOVrDHPrHD
	Urbcw8UIDJ3tpMeEFRm5OFPgsLIf13bITl56XObGkwNfFuWrPanpn/TFbnmdw1adq08h
	oeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=KdnvKlAdt9jBUnhQ3OY+KijSXCnOUs8goW7ZFvI127c=;
	b=AoXg14xMiBo6gz286P09Fa6+JqBbfn9bVtwOyS14uNNLJMonQYnxplYnAumcpFg9ti
	JSmnDmFDkWoLC+B/ArKMKf4A5CCPDQaJvM0DzTiJx/mvb9w/QFVjGD7pTHr3Dky+INbt
	qIeB5AIVMZOEcDoATUXbZew801EFfbgF5wn01KOv+WRxRbBfQW1UirNuSztJUof6fAXo
	eDZ4dPy7ZIqcezzCB8XOzp+aBzEdSEn5UsOHraSe1YMw7eBnFhnn2rHu3/S8aLEVwMaB
	t5oeTQ2FQxOhXbzYd4QISYCSvt1tjyNf3JOPmj/mQsmmbKZ3i0m2BRuKgaIRcftSG9Li
	gSsw==
X-Gm-Message-State: AOUpUlHi2Kj9tw2DV6AxvozdM+Xuf/cOY+SMyNOIeNLRW2WsgK1AzoDt
	8JZnh4giVcTPp78ELBDhiyv361ebjCDtf1ji5tyN70Be
X-Google-Smtp-Source: AA+uWPz505oEyY9+rx6nRnfUkp6sLv1n4YPIIpN23ya7mUtV+4aca2HNmVbDW/1rWphuLVF01DfsiDSqIu3jzTCPN1o=
X-Received: by 2002:a19:5788:: with SMTP id
	l130-v6mr29957017lfb.93.1534759577291; 
	Mon, 20 Aug 2018 03:06:17 -0700 (PDT)
MIME-Version: 1.0
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 20 Aug 2018 12:06:00 +0200
Message-ID: <CAPybu_0OGj5z+qHP0f=s30cEOAo6nryJm2x=+S2JLAV_4HWtjw@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: x86_64: ldd does not work (not a dynamic executable)
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
X-List-Received-Date: Mon, 20 Aug 2018 10:06:17 -0000
Content-Type: text/plain; charset="UTF-8"

Hi

I think that I found a bug with ldd on sumo. Whenever I try to use it
on the target with an dynamic binary, it returns:

root@qt5122:~# ldd ./qtec_webcam
not a dynamic executable


The reason seems to be that it cannot find the dynamic linker:

It is searching for:
RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
/libx32/ld-linux-x32.so.2"

whith ldd being at:
/lib/ld-linux-x86-64.so.2

This can be patched on glibc with:

git diff ./sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
diff --git a/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
b/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
index 44d76e8aa1..611efd56b0 100644
--- a/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
+++ b/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
@@ -1,3 +1,3 @@
 /LD_TRACE_LOADED_OBJECTS=1/a\
 add_env="$add_env LD_LIBRARY_VERSION=\\$verify_out"
-s_^\(RTLDLIST=\)\(.*lib\)\(\|64\|x32\)\(/[^/]*\)\(-x86-64\|-x32\)\(\.so\.[0-9.]*\)[
   ]*$_\1"\2\4\6 \264\4-x86-64\6 \2x32\4-x32\6"_
+s_^\(RTLDLIST=\)\(.*lib\)\(\|64\|x32\)\(/[^/]*\)\(-x86-64\|-x32\)\(\.so\.[0-9.]*\)[
   ]*$_\1"\2\4\6 \264\4-x86-64\6 \2x32\4-x32\6 \2\3\4\5\6"_

I can very easily make a patch for this and send it, but  it is too
strange, that I have been the first person to stumble with this thing
:), and I do not know if this is a bug OE-specific or shall I also
ping upstream.

Any ideas?

Thanks!


-- 
Ricardo Ribalda

