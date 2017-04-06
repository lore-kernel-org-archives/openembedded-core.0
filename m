Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id B9FA277AA8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 12:09:50 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id t20so58690855wra.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 05:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oYzIxOjqJ9mtz/HFeP8sgaVeXC11y2kNq01ciTLj/JM=;
	b=JSXX6WqjdbYrExLNRd+zY1FtTN0zmvXQIll2LkzRhVJB1iW+e+DBSRgrGYmg5mSzDo
	aGc7wDst6zA9QCU7Vm3eJ+aQGzxIuR2PKAphs0slia3SIsb4hPEsFPgSbh4NnK6LNe8m
	BhwHPRjYdpTnBxXPwuxTYq0PQ1CnGv6vwmbEE8fykW21LTNaC4tsCbm66yd0dkhuRr6w
	QSrj2/HSuwjdjnTqx68NnpKwdKPrZgMUFAwydmReNlh3BWfZIuhGin1qxiXcvMcF41Y9
	OJ+9+8iWoDmEmIH/sr9z+1QxNAZkkHqtIV13S77cCuePSAfN96lh5wWagVFtqLoiYL85
	isZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oYzIxOjqJ9mtz/HFeP8sgaVeXC11y2kNq01ciTLj/JM=;
	b=WFNx0tbcq9D5y9zlKtcKdBP4ueYQOl+BsfpVZnxQqnvArwuArha9Xc3tI/F2wz7DVN
	ky/qxA6TOSfg7NOGL+zeKLQ4dwWUCSPdsf3Nl4GAxtXZ+WrYL4DVoYnpJHLTDJjRIo5V
	5vLjguEflkf0XPagp5ryC4L0lZmHk4TEx0tqQfLXclA5p3SP3goxAkOmiTZQXKdXhVa/
	+Y6FIPB10ZJfd6It9IqILQ32sqOeDjQFq+U04yuh1sxP+1jMtd0EJf0gHTn4NO8nyMWQ
	BEKUjby/0c0zfDI84BkjCrfm6fnsEJmqNUDF0MANjZbzNfvkHHQfE1qkaeH257AK9wVu
	nmRg==
X-Gm-Message-State: AN3rC/6CLoyRKvktl9xrqI4ZTpMVnQAt0jgukyW0eBTHZ3FwwRFcYeqnjiabuSeJP4M1lg==
X-Received: by 10.223.139.22 with SMTP id n22mr1766545wra.38.1491480591618;
	Thu, 06 Apr 2017 05:09:51 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.167]) by smtp.gmail.com with ESMTPSA id
	m7sm26221884wmi.34.2017.04.06.05.09.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Apr 2017 05:09:50 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 14:09:40 +0200
Message-Id: <1491480584-9725-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH 0/4] Fix some incorrect TARGET_-* flags
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
X-List-Received-Date: Thu, 06 Apr 2017 12:09:51 -0000

From: Ming Liu <liu.ming50@gmail.com>

I had found a lot of churn in sysroots when multiple MACHINEs are
sharing a same build folder, which is the case in my company, after
digging into it, I found it's caused by the TARGET_-* flags, they
are exported but not in use at all, they should be replaced by
particular flags for cross,crosssdk,nativesdk,cross-canadian, native
class does not need that because it's already done in:

commit 05a70ac30b37cab0952f1b9df501993a9dec70da:
[ native.bbclass: Override TARGET_ flags too ]

Ming Liu (4):
  cross.bbclass: override TARGET_* flags
  crosssdk.bbclass: override TARGET_* flags
  nativesdk.bbclass: override TARGET_* flags
  cross-canadian.bbclass: override TARGET_* flags

 meta/classes/cross-canadian.bbclass | 5 +++++
 meta/classes/cross.bbclass          | 5 +++++
 meta/classes/crosssdk.bbclass       | 5 +++++
 meta/classes/nativesdk.bbclass      | 4 ++++
 4 files changed, 19 insertions(+)

-- 
2.7.4


