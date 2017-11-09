Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB4078493
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:53:41 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id c186so1423862ywb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 17:53:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6zu2w7U8MWFTuTDgsuOBDzHT6RRfxp3lDUx7ldnDz8Y=;
	b=aPj8T921Yzug3WqYVnHTwn0R7DIVNsvURFAr8sBrDZT8kEzGkGBPnUHYvK6d/gDNSi
	E1CsTdAz6pzbjTBorE6U2Iy6NAcMMUxsvLZESzZ7R8O4gr5QP9zjGelO/5C/w+pFY27y
	mcoyR7bdwmcgM8lFq1bq7MnU7xW23arZ7EMqPDZDJP+l7PPtaXZZ/aZyQVefaNPxfbgV
	GL76kfavgcbRkaJLIEJB580gNcfpBMptEhe7Qe+6TJY+zZqJCU+Q/TGPfHrXRmUDda/t
	2UHevF+GIXIHGuE50FRCvuPK7GocwygfjNSgV6e8zWEOgwI3C9PDVA0ZeoIDX5f22WLn
	taWw==
X-Gm-Message-State: AJaThX4lx1ZgPU0EExT+sl7cZkUOE+M1Fh3kyGKOXTg2hEi7CNscQDdE
	xwKjEN01ffy9eEzLiRbeepmV
X-Google-Smtp-Source: ABhQp+Rfa9G39boCSxsqMtjWwvSt1sZ4Avp1J5NafbV1haT4ZNQ8sF75u8XPR4oQop51pF+qT5yH5A==
X-Received: by 10.13.229.131 with SMTP id o125mr1612426ywe.377.1510192422114; 
	Wed, 08 Nov 2017 17:53:42 -0800 (PST)
Received: from opus.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	h26sm2850736ywk.67.2017.11.08.17.53.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Nov 2017 17:53:41 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Nov 2017 20:53:29 -0500
Message-Id: <1510192412-5065-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/3] wic: Further enhance UUID / fstab support
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
X-List-Received-Date: Thu, 09 Nov 2017 01:53:41 -0000

Hey all,

So, per Ed's feedback on my first series, I went and spent some time
trying to figure out how to have wic know what the UUID would be when
updating the fstab.  It turns out the easiest answer here is to have WIC
make the UUID.  Per Otavio's concern last time, I also make sure that
the filesystem UUID can be passed in, for reproducibility.  One thing to
keep in mind here is that FAT filesystem UUIDs are a bit funny to deal
with as mkfs.vfat / mkdosfs / etc want to be given a 32bit hexadecimal
value.  But when we talk mount, it must be split and it must be in
uppercase.  To make the rest of the code easier I'm encoding the '0x'
portion into part.fsuuid rather than doing "-i 0x%s" in a bunch of
places.

While preparing all of this, I found a few minor things such as we did
not test for squashfs and --use-uuid (not supported) and an incorrect
comment around the btrfs support.

Finally, Ed asked for oe-selftest support, and I agree.  So please don't
merge this until I follow up with that.  It is on my list but I want
feedback on this side of things while I'm doing the testing side.
Thanks!

-- 
Tom

