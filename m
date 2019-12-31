Return-Path: <kalle.lampila@lempea.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id EDA9D60879
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 15:10:59 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 9so27180449lfq.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lempea-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OeAeGR6tqWSyMetbgvIMP6ho1oeAzkl44Zr+2OLytNg=;
	b=dqE55WCeln7SvLXKDi6ilqjvfZ2EXlMdGEUp0Z9c7ukMWLMAP4KMnrS1fBo91g6gpF
	eF1rV0puCKPsJhDdwJJyqTMn5uwPMPQh5qVCCN6nRJC5IKckySHQTqzASKCWWd923DZp
	sBB8oofKh2TW8JBj0MLtZJKmWV97cJQTUOvxQOGiVHO+OgegkhVlNsxNWt2F8JF/WGh6
	ohL7doTM87Wabb1DN9PPxvcDVdrrwIWcf0NJfhUmabV24fOY1O2guPqVm8OkeRBkgvs9
	cXvwbgNJgibHhPm4CZPkBIB9kSz7X4ETwYkX5CsrXnhxDKV01nNCsCWndDusBzQ4nYlo
	tSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OeAeGR6tqWSyMetbgvIMP6ho1oeAzkl44Zr+2OLytNg=;
	b=UxAck1yqbBlD8D89paJGuj7Y5gm5feAKJbrCIiotTJyTfNqTPAGKPdupexFKGqP6xU
	zbCnByDe1rOjsKSwnN29KBnT6kXUN6fUQ60OuDTKoBeFZ2JxxI/qROsOo/+xBT7kzWtr
	QqDO1n5CUqzNG7fzeKzN21McaDbLkDJejVKotpln+An325UlAeyk/9puS+ZQBT79b/Qd
	cuxxpCCfVtgbZdF6vOktOULIu3YoFOzn1HsTT/jTlYhMSh/GkyTPhRILpwgK4pxpboV2
	EFTHOgrwYSeuxmXeZP6FIYuRYVoJRHP45Sb/+Z9WWDOr4vGCuE9lf9qXrIkyQAOWGGbC
	i8Sg==
X-Gm-Message-State: APjAAAVWARJijXV+w9bTb+PA1IM0w5XWtZ2Aqa76PHIC1HJHrQF33K77
	LfW8UZSovHR7Tpvqprc0ZL2dm/iNGZfskNkCFTVZIsdaB90=
X-Google-Smtp-Source: APXvYqwBu1HV0zE2KMCYAlUm+16bFv8mvfOoEvtv9Bl4wJwNrnimo9tw4sB2HB4uxBSxRHL8cTXKeGoALSi9o/SeKiI=
X-Received: by 2002:ac2:5468:: with SMTP id e8mr41775355lfn.113.1577805060190; 
	Tue, 31 Dec 2019 07:11:00 -0800 (PST)
MIME-Version: 1.0
References: <20191231141538.9020-1-kalle.lampila@lempea.com>
In-Reply-To: <20191231141538.9020-1-kalle.lampila@lempea.com>
From: Kalle Lampila <kalle.lampila@lempea.com>
Date: Tue, 31 Dec 2019 17:10:49 +0200
Message-ID: <CAEd0oqxbjGmJY8g30Ax--bHydYmZC7n9bo2HGF-Dv0nJoAZAOA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic/filemap: If FIGETBSZ iotctl fail, failback to os.stat
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
X-List-Received-Date: Tue, 31 Dec 2019 15:11:00 -0000
Content-Type: text/plain; charset="UTF-8"

Some file systems don't support fetching the block size (notably the
file system Docker uses for containers), so if iotctl() fail, try to use
failback via os.stat() to get block size.

Signed-off-by: Kalle lampila <kalle.lampila@lempea.com>
---
 scripts/lib/wic/filemap.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index a3919fbcad..c53147c2f1 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -34,9 +34,11 @@ def get_block_size(file_obj):
     # the FIGETBSZ ioctl (number 2).
     try:
         binary_data = fcntl.ioctl(file_obj, 2, struct.pack('I', 0))
+        bsize = struct.unpack('I', binary_data)[0]
     except OSError:
-        raise IOError("Unable to determine block size")
-    bsize = struct.unpack('I', binary_data)[0]
+        bsize = None
+
+    # If ioctl causes OSError or give bsize to zero failback to os.fstat
     if not bsize:
         import os
         stat = os.fstat(file_obj.fileno())
--
2.17.1

