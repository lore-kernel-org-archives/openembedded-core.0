Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8709F786FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 01:06:24 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id l24so317552pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 17:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xBiyDE9G41VnK7mbXI7Es3XoDd044gFfvqcziMNDM44=;
	b=J2RdbXn9vGCVRpJcjtiHerBaSXghmz1JUJyPQicL5b9wU6KvreEYvKMnNhKsZmG8Um
	kAviieSRPaQYHNAjkW98X67qHRTsjklGcx9i3njh01H/rz9GkYgfbsTScL0sozMvzvgg
	TafUceFgsrEfpoAeSwDr8Hcc+RAW+FxRMAP5/cty7TmoIW0Uq/VsoA7y5qg39Lj5cEhn
	2yk3nC2RVkw52D5fwTb02F2HLkX9wduv3Iwz33+YQoIkWCJB+7Shi+D4ROCR2VtWVM9m
	QRpyhQGapkG44szAMb5L34w7Wi3EsiakbcqZ+Ucna/fDAqdTWjwupENf/5Wuf6lMPC6C
	DbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xBiyDE9G41VnK7mbXI7Es3XoDd044gFfvqcziMNDM44=;
	b=UDsx3TD1lmr2mBUradhpyFRCxrewQ4IEXNf0Ygm2faa1I7Uud2/Wjys7DU7NUlddZz
	P2oM22OoVY241Twbrosr+rMN662LrSMn8zuYc3bDE2AXOlTWbtssqZ+5Blwvw5AYnyC5
	ui+J6aPDF4V7YOdBM44+Ca2EBh7DKbOk540qKvJV7ntrkr2Ua/CHQ9aDBDfsyoYPaCRs
	Tr4UtoMACPm9G/CzImFwL1FCOWbdvQ7Ok0c8e+LW6NOjaBBDg3f86zUkp/zr0+xonGB8
	pv0JThhGtChoXIy7w64zBy4Jg7/NoVs+ULXvIeX3KE4Yj7uMdbTE38IvacpjME8XbaiY
	k7rw==
X-Gm-Message-State: APf1xPAuFXNAEf3l81ZLJWUYuUqZ/NRmQLQYyReObZEU7gyCbM/ZH5l2
	4irNqLFtzj9iTbnm2etPcKWqRQ==
X-Google-Smtp-Source: AH8x226X1elrGytT8DAXLn282nx2m0QoEY+lBdE6esuff5FaVIDichUw3laQDqDnv4VXr0Eak/Z4DA==
X-Received: by 10.101.80.6 with SMTP id f6mr12607310pgo.272.1519779985184;
	Tue, 27 Feb 2018 17:06:25 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	a21sm492726pfl.137.2018.02.27.17.06.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Feb 2018 17:06:24 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 17:06:17 -0800
Message-Id: <1519779977-9136-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [morty][PATCH] buildhistory: fix latest_srcrev in the common case
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
X-List-Received-Date: Wed, 28 Feb 2018 01:06:24 -0000

From: Christopher Larson <chris_larson@mentor.com>

buildhistory was writing srcrevs.values() as SRCREV when only one
srcrev/branch exists. This returns a view of the dictionary values in python
3, and used to return a list in python 2, neither of which is an appropriate
value for SRCREV. It was resulting in latest_srcrev files like this:

    # SRCREV = "346584bf6e38232be8773c24fd7dedcbd7b3d9ed"
    SRCREV = "dict_values(['346584bf6e38232be8773c24fd7dedcbd7b3d9ed'])"

Which in turn would result in invalid output in buildhistory-collect-srcrevs.
Fix by calling `next(iter())` on the `.values()`

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit ef826a395612400924bbe49859d256b237ff59e1)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3a5bc2c..d82e9bb 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -833,7 +833,7 @@ python write_srcrev() {
                         f.write('# SRCREV_%s = "%s"\n' % (name, orig_srcrev))
                     f.write('SRCREV_%s = "%s"\n' % (name, srcrev))
             else:
-                f.write('SRCREV = "%s"\n' % srcrevs.values())
+                f.write('SRCREV = "%s"\n' % next(iter(srcrevs.values())))
             if len(tag_srcrevs) > 0:
                 for name, srcrev in tag_srcrevs.items():
                     f.write('# tag_%s = "%s"\n' % (name, srcrev))
-- 
1.9.1


