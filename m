Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id EADF57790C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 10:22:50 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r125-v6so10768023wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=sbke/XsrFVt8OehKVohKeR28CZDlFv/ruN9t/qADj00=;
	b=G2TIIaZXp8barQJR5QNFlbppvv861B7eLuQdIyoIC1ybBLbWsogx6jgRyBnl5XAPBO
	M8oYsnGIGtop/RjymgFR1D0rxuEYsz4o8mKqsJS/uP8yUBDIi0MHnks/BJJUKnoEtFJE
	BM5q5M5A7y9LAEBKxv+KVBsz7B39UyklLH7vl6yfCPCYqMeeaBaq5UE+X0O1RHCieFaA
	H3brgMpJo3NpiFR6NZ/ybH/1PmZXgPO2qRpUXhObnksFPUa+fvynQAUsscDCW/oK8czq
	rII+WYv4O0IssQ75e6pdyRo7X3crM7nvDK7F3VIOIsUdK6WAVUHJLsOfrZOXeepb/wOp
	lr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sbke/XsrFVt8OehKVohKeR28CZDlFv/ruN9t/qADj00=;
	b=VLlOMfHjQFqfoYwikRCjbFMY9IwwuS+YeOrdDYx2mbaDHX1KK9omaoxHqFcqh29TEN
	9MMbzsmx1SU4PbOPwlwe4a53WHCBH0DLfDF+ZX46CBbVrt7JyoTZBUGw18UrvlxO+f+t
	kwNxfxvfzwjGP+SpVLhvwQwhZ3eC8wDaa3ZBOV/mN5GSY7V9i9+L0wtmzAzHSJyQVGJr
	zSc7Z0C7OVXYl+OdQ7aLzoxpfW09fSoP3ERbMWqMkApxX/Llu1LR8CQqOGj0ktLBwAhj
	GO0hYoyHoSLVXpRwXJ1yAzyhvQycR02bHB9W/NYaWFZak3pwLXJm5+Cca85Rk+44Ltc4
	fwKQ==
X-Gm-Message-State: APt69E1lpjBh3gJlU/WFrEwmAwWg1dYcMx2ahC1XpO+FF+G44gaLZjDV
	lRMFqCPXYzwvG+6N3kaB1PnnhEHK
X-Google-Smtp-Source: ADUXVKJBuCW4Ucc8W6kgmf6z9AGF85tUTAVZf/vnuXzQMuk2T+evGYqUgDQk2otc5lgk0WYZNUW2qQ==
X-Received: by 2002:a1c:f45:: with SMTP id 66-v6mr1325227wmp.124.1528280571454;
	Wed, 06 Jun 2018 03:22:51 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y186-v6sm5031015wmd.38.2018.06.06.03.22.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 03:22:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 11:22:49 +0100
Message-Id: <20180606102249.18812-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] attr/acl: disable make clean
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
X-List-Received-Date: Wed, 06 Jun 2018 10:22:51 -0000

These packages use hand-grown makefiles which don't handle cleans as they can
invoke /usr/bin/gmake directly which may not exist.  Until new upstream releases
are made (which have ported to automake) set CLEANBROKEN to work around this.

[ YOCTO #12775 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/attr/ea-acl.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 1339eccdbd1..9336ffc9389 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -7,6 +7,9 @@ SRC_URI_append = " file://0001-Added-configure-option-to-enable-disable-static-l
 
 inherit autotools-brokensep gettext
 
+# When upstream is using automake properly, this can be removed
+CLEANBROKEN = "1"
+
 # the package comes with a custom config.h.in, it cannot be
 # overwritten by autoheader
 EXTRA_AUTORECONF += "--exclude=autoheader"
-- 
2.11.0


