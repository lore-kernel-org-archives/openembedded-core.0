Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id A303071DA0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:24:04 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id j13so44226645iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Ki63rM3JJ1dgpht3XH9EaziudYxsXShbjpVUv/BMuuU=;
	b=rfmuu6ZSdxOBQRW+6/S0eQel4Et+cTMH5UOmJgh2RC0tjFqLtKmKd+4y2ouN0Toy+o
	iK4YTaHI90m2afltU0oOvejg3fmjRUdXwF2UGvy6Sx8fyS7pCFhFeAzlbBX9tLCnx1ss
	5MQi+bOWH2jekm1GDZdqQaVmEaPRYVcFXownbeuMSQJGnPrPEkB6i9Tbsh7X+C9eR5pF
	8y5OwVqI/oboyuhpFfSzJJLstBZXuKOwlb3XYFwNICkX1eSPqhfZmdgvg0SiOdLId8kA
	/uLR1CMjHYPB/bbttWvPlTAHDhE+IXElUXmo9oURKlNeN5ztH6PneleKVFmIacbH/khO
	HsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ki63rM3JJ1dgpht3XH9EaziudYxsXShbjpVUv/BMuuU=;
	b=df/dOyjaYFh0Fsen/rsmFnc8276PxJRT9C+4Un487fRn35P/QYJ2w7zfq39iTVGBw8
	uYZLVe8bPjn2bwqhXSZnHtig7orlSC+1BbElCZTNX/C4pd1czQDs52hyQ1j/d8BjUWtd
	isY9R8GIW7jAw/P6pBruGM/L9w0rXy7a8+X+bbwpBTCchS3823Fmo0yhNxFI7CjOTWgK
	jtJTtuJ6hx9EoMgm0SUxOl6ZIf5nlJfynL/HkNF5C8Bh4gcgYtI07U6lf5DgSFABbSoW
	5NYxEqFXe4NImt2HoZks8jBCQQUxqdSvIxHnLI48LlJxNrFZbY+MDUa0BC5CafHd6hJM
	bcYA==
X-Gm-Message-State: AIkVDXLLCZVyxeiUH6QRmN29sf+p3GewMQqJaVFGHkaQZsqLgLlS5a9gFAF/w6yoQ9ozwIRE
X-Received: by 10.107.15.196 with SMTP id 65mr19524913iop.141.1484317444490;
	Fri, 13 Jan 2017 06:24:04 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56056.dip0.t-ipconnect.de.
	[87.165.96.86])
	by smtp.gmail.com with ESMTPSA id w192sm978252itw.3.2017.01.13.06.24.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Jan 2017 06:24:03 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 15:23:56 +0100
Message-Id: <1484317436-13263-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] rm_work.bbclass: allow preserving additional content
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
X-List-Received-Date: Fri, 13 Jan 2017 14:24:04 -0000

By default, do_rm_work either skips recipes entirely (when listed in
RM_WORK_EXCLUDE) or removes everything except for temp.

In meta-swupd, virtual image recipes collaborate on producing update
data for the base recipe. Tasks running in the base recipe need some
information from the virtual images.

Those files could be passed via a new shared work directory, but that
scatters data in even more places. It's simpler to use the normal
WORKDIR and teach rm_work.bbclass to not remove the special output
with the new RM_WORK_EXCLUDE_ITEMS.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/rm_work.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 64b6981..1ec63b4 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -10,6 +10,14 @@
 #
 # RM_WORK_EXCLUDE += "icu-native icu busybox"
 #
+# Recipes can also configure which entries in their ${WORKDIR}
+# are preserved besides temp, which already gets excluded by default
+# because it contains logs:
+# do_install_append () {
+#     echo "bar" >${WORKDIR}/foo
+# }
+# RM_WORK_EXCLUDE_ITEMS += "foo"
+RM_WORK_EXCLUDE_ITEMS = "temp"
 
 # Use the completion scheduler by default when rm_work is active
 # to try and reduce disk usage
@@ -37,7 +45,7 @@ do_rm_work () {
         # failures of removing pseudo folers on NFS2/3 server.
         if [ $dir = 'pseudo' ]; then
             rm -rf $dir 2> /dev/null || true
-        elif [ $dir != 'temp' ]; then
+        elif ! echo '${RM_WORK_EXCLUDE_ITEMS}' | grep -q -w "$dir"; then
             rm -rf $dir
         fi
     done
-- 
2.1.4


