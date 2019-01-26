Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from mail-it1-f174.google.com (mail-it1-f174.google.com
	[209.85.166.174])
	by mail.openembedded.org (Postfix) with ESMTP id 42C397C45B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 23:31:00 +0000 (UTC)
Received: by mail-it1-f174.google.com with SMTP id i145so15728543ita.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 15:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=95cIqlOjMbrIXrRMNmQguM28sfcOxDaeVuiBNj/2cTk=;
	b=Nxg92nVJf0RELC5o+7ZG2qnXigfIx665lpCQ6a8MBTamJ8FpyVahLONFPStgWksw0G
	bBQXmmN92EZU8PLQjTmOYtxgqjwbZsKgUxAu9lZAnCAYgm5JANwTkriVjKJjnwvp4UN5
	06yuTeLgwc74ps768FWLkYoRixNDVMNxboHlH8wBY0YrVw3Vz/8TXA3501naNG6k0WxC
	0coVdKDnwj4yuyKdKAtm7NjRvfZ1T7R+M6KVH9JGWfYbVjqWtnIHgm99sTSyXqgTiLGj
	/7dYJ3RXSqFbTZ5DNMmX3brjRRiHAFDm8HqDpyWrB6wOK5QAPc6wbijI8D+RL0x0/E/T
	vIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=95cIqlOjMbrIXrRMNmQguM28sfcOxDaeVuiBNj/2cTk=;
	b=e/JfFvrdt4JEUdzb95mN7+BYCNalaeveXL842M2xeJZnfZFygrpE5u9iDwrHBI1WE1
	jMY0QGjHFTTTkXvYsq5T8wbjBYDNiTnbE5u/Zy5KlVsKDmplxfOzXgcN7P4wm+WdNjSF
	luwdi5p+pprjIzRAvQ0XPBpGEapmF9iQly5Z8ZEsWQQU2ZbiyrBrtlyJeDOvDt+cZ+hj
	3pj+zQGvJ1AgqUA0HbwsXnH7N885N76HQxNZ1YYaMuXn5JOp63NxSm5XacT1fgUaJRfb
	nBYcFNADnhhtB/pRlSRHmtINvfJzxL+hCdg9BqtWvGexm86gOI87GH5aB8EZeN2cjIOd
	VCaA==
X-Gm-Message-State: AJcUukfWak2nWaJgCOKFlVaVvg/JPNEBXtlEoZKwjivqdO/Ujb7t9mIg
	CUWLnDeLrXm1J/D20uQARBAOSxRBOINH4qMZa0kwZe7E
X-Google-Smtp-Source: ALg8bN59hOcaGPgNL6dpHnWppkjQjvrMW0JF6My5846hWk+tixvQBMuxLJo7ewSHBXvCjBz3Vzq1NzMZSYYMnh5VyzA=
X-Received: by 2002:a24:2e94:: with SMTP id i142mr402096ita.157.1548545461035; 
	Sat, 26 Jan 2019 15:31:01 -0800 (PST)
MIME-Version: 1.0
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Sun, 27 Jan 2019 00:26:44 +0100
Message-ID: <CAJkqNs0KdJaZxOxvLE08n3HA3KrgtwQar26wibu1PtC0cVC6iA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] gcc-shared-source: Fix devtool missing patch/unpack tasks
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
X-List-Received-Date: Sat, 26 Jan 2019 23:31:00 -0000
Content-Type: text/plain; charset="UTF-8"

Devtool needs to execute these tasks so we cannot disable them
but if SRC_URI is empty we don't need to disable them anymore.

Setting EXTERNALSRC so devshell can find the shared gcc sources.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13036

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc
b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index aac4b49313..bc49e95a3a 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -1,11 +1,6 @@
-do_fetch() {
-   :
-}
-do_fetch[noexec] = "1"
-deltask do_unpack
-deltask do_patch
-
 SRC_URI = ""

 do_configure[depends] += "gcc-source-${PV}:do_preconfigure"
 do_populate_lic[depends] += "gcc-source-${PV}:do_unpack"
+
+EXTERNALSRC_pn-${PN} = "${S}"
--
2.20.1

