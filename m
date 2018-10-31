Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id C379D78E4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 18:54:28 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 8890010C0C47;
	Wed, 31 Oct 2018 11:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1541012069; bh=HTkVgJkb9O8BI7pB1RDR0DOlSnpvRTGkNWmBzt62AFc=;
	h=From:To:Cc:Subject:Date:From;
	b=WrkrJZyv0Ohx+pfOId049FRfzTWpXvNWrhFx2vaI/YR213WbyPT+fCIMRVEHdyxkY
	kl5IcSTlp+aVQX9mggiY+djBeIxdEk4g8VKKAjdJlPF4iA/lAce21oMr/Ni+EJQ4L8
	lpvQS2XT5b3D++ggSKjwzw3L78Y5qJyhZJGNNGbrkjjt8oNSL+rlmMftko5OZbSCWX
	C7dhmBGfJSF0gMjBlbfFhv5aSApD7QX1TcmhBzGsWaqIWX6GsJgTA6CPl56rWAigRX
	3O8JlIY2ML/VsdVzKxFemZfhTzbqa/fhrAVFIdF1YAt2QHD3D9VnlX2VQpRvQo1nfy
	MMsS+NtvMkddA==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 1432A635C;
	Wed, 31 Oct 2018 11:54:27 -0700 (PDT)
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Oct 2018 21:54:23 +0300
Message-Id: <20181031185423.21100-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>
Subject: [PATCH] perf: Disable libunwind for ARC & RISCV64
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
X-List-Received-Date: Wed, 31 Oct 2018 18:54:28 -0000

libunwind is not yet ported for ARC & RISCV64 and on attempt
to build it for those arches we just get an error message.

If we explicitly disable libunwind it is gracefully handled by
perf build system and it just gets configured to not use it
so perf is still usable even on those arches.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index af099043e1..bae4948751 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -26,6 +26,10 @@ PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
 PACKAGECONFIG[audit] = ",NO_LIBAUDIT=1,audit"
 PACKAGECONFIG[manpages] = ",,xmlto-native asciidoc-native"
 
+# libunwind is not yet ported for some architectures
+PACKAGECONFIG_remove_arc = "libunwind"
+PACKAGECONFIG_remove_riscv64 = "libunwind"
+
 DEPENDS = " \
     virtual/${MLPREFIX}libc \
     ${MLPREFIX}elfutils \
-- 
2.16.2


