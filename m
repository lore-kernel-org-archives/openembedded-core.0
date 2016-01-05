Return-Path: <dl9pf@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	by mail.openembedded.org (Postfix) with ESMTP id E6FBF600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 20:30:02 +0000 (UTC)
Received: from elrond.auenland.lan ([95.90.4.156]) by mail.gmx.com (mrgmx002)
	with ESMTPSA (Nemesis) id 0MQzIE-1aeEly0QjW-00UNhO;
	Tue, 05 Jan 2016 21:17:28 +0100
From: dl9pf@gmx.de
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jan 2016 21:17:24 +0100
Message-Id: <1452025045-32026-1-git-send-email-dl9pf@gmx.de>
X-Mailer: git-send-email 2.6.2
X-Provags-ID: V03:K0:bSscaLhulDjkK1ErAuboAAWvVkjgcOlTk5iFFI3VZJkt2IzBdWz
	IFWUuwdkuz4kvVyW6fTN0ly8WGQjYQO9fGvVnVm/ykcmZPOS9h3N+6cUKTW68r444tkz/bi
	o7jCHL/i214oNn9Jf29kUu8uJuIDNSL+5zWnjkAWyh884W1E9nCzidWx4o51VbxDew1sWdB
	tc5nnrjn78NdDtG6bP8XQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:ptgzg9Mnf5o=:+UF924vbPEbiY7LMYuXzpT
	+tuJqUHVJps27pYH9oP9HyznsZonoN5NXRhudU8oBWUFBxgoEqnj/7o1JoxYSBmaTT75mQ+eY
	zTokcTNnZrR1b2ECPxtIwOv17NrsKtyZt/A6MxOj8WJvjOzUBxW1rdnhnltUb/9qDXrbSHAfT
	P2UnKFsmiPO/1AShwUgXh+8ZcMkjSXB9RM5secAA5IgXUrqWv/M8R9uoeZ3nB8iVhkq9Fo8Nx
	y3nLP/LtFYgLE7ORR8ZGBbzamq6lPCI/187wHfdtRcQSzRjojDNE9n2Qf8Ahn8+OzdWkvI4Xj
	I2pU86zJExAmy5/4zi9od7iFyJKo/IJ75KcN1h11jsTATt4vBinfRf3+dR/G3lY6AtmHFm6a7
	GQcyeiHdkyltpyOEANuHuZmjOJ5LB9spoC8SEzphHqyBIXP70YewRHPZBFGmMsjiXXOPf7fv/
	zizGwR13+Sz7gPmDpNZ33uWYVTdqTzFMd2PsOXO9PIfInHSbLztk4Ig7z9l0Xvj3UpyVt8JRd
	N51W5vDYrxD6mPOXzLdV/5npcxrGbi8MsSalCXh189onBosa0zqM2FS+8SxDOM3YnJsoiJC2d
	bRHjLL4RqcrQCSj2GCxoZ1svs2gvhwtPUvkc3KOwdeDdZvnz6v2my5n95WbyEapTk8wFMEhCd
	nbndmbuNfA8npf5Y9wqKPjQveYFCM+i07jwIqCrv8+ClH8Om+yRaHEe2yco/zKagSlWWK3m4h
	3JkiW4/ZT5N71qUVOj7nX3kUgDOYkhIp/GB1/oWP8h7AJpZxrQRXghmfQ1U=
Subject: [PATCH] [master, jethro] Fix connectivity check for BB_FETCH_PREMIRRORONLY case
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
X-List-Received-Date: Tue, 05 Jan 2016 20:30:05 -0000


Hi!

This patch fixes a bug in the sanity checker that is visible if
you set up a PREMIRROR and start a project from scratch using
BB_FETCH_PREMIRRORONLY set. In this case the sanity check would fail
as BB_NO_NETWORK is not set directly
(just indirectly in the fetcher by BB_FETCH_PREMIRRORONLY).

Reproduce: Set up a PREMIRROR in the local network. Disconnect from
$INTERNET and build a new project using the PREMIRROR on the local net only.

Expected result: Build works using the PREMIRROR

Actual result: Build fails due to CONNECTIVITY_CHECK

Best,
Jan-Simon

