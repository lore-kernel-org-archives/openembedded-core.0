Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94E606CC4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 20:13:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9LKDCQP025968
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 13:13:12 -0700 (PDT)
Received: from yow-kscherer-l1.wrs.com (128.224.147.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 21 Oct 2013 13:13:11 -0700
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Oct 2013 16:13:10 -0400
Message-ID: <1382386391-22092-1-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [Patch 0/1] pigz: Add pigz to buildtools tarball
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
X-List-Received-Date: Mon, 21 Oct 2013 20:13:13 -0000
Content-Type: text/plain

Over the last month I have been working with native sstate cache
reuse. I have had many issues, but have been able to resolve them. One
build failure happened when almost all of the native sstate files were
properly retrieved but zlib-native was not [1]. If
sstate_create_package in sstate.bbclass gets called before zlib-native
is built, tar in the buildtools executes the host gzip, which tries to
use libz.so in the buildtools and fails. By adding pigz to the
buildtools this race condition cannot happen.

[1]: The bug where native packages are found in the sstate cache but
get rebuilt anyways seems to have been fixed recently. This has made
reproducing the build failure more difficult, but the race condition
still exists.

---
Konrad Scherer, MTS, Linux Products Group, Wind River

