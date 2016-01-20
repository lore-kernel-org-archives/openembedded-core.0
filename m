Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 21DFF605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 01:34:10 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id j3so14426555oig.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 17:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nudNhrFDdTGVVH83cPeKDzB6f26nP1gaWFJppDjcLaA=;
	b=ry8b0xY0mcb+xjYRQ1wh9r3bfsJ9nib60Gi4ZcsQn/ZtRUIVLNrgCH4B3cn11zxK9b
	UrX4jpaxTrCjPMSlsqclqoPS9LgHiuqOwvi4BYxbOPIe++w2z6mA4oYfGpLExCq0WC+V
	mXucbQ7oejMMLpRigsBHlZ9nMfpE9D7xU97EHcT72xNK2X/wjw0/i3nRXbv4YbRRbiFx
	0nsITf6u+AHWNy+MEInGAOU+1APa+pGu8TH5JSz1/RO9zBSfV0z+lRqZ+YRNvgcVcD2Q
	O4GUuJqFj6fHK8lEtoirn564rOnnvBzmxE96yqdUquiCpZKp6rP7bP18UYz0i5wpOIr2
	8Vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nudNhrFDdTGVVH83cPeKDzB6f26nP1gaWFJppDjcLaA=;
	b=ixcwiuT5nup0keWVEe/py+a6gJi5RkZY5GVC0KYLiHUU215sknGpP5kq/bF8MV5sjQ
	xTIkyM5rx9xBtHoGOEjUrPilvd+rly2AtyeYhTe84NRYEbs3Yg2UZx1cmA6wF9Fh9j8k
	PfWpOUoxdpsk3RrhTT/v3QUQSCsxOmqWkkzCWdIrir3fOyQ72RfmJ/FDceoqGIkNrWG9
	6o9OB9l97JrBxLYENRYXabQky6ezwug5wGxX9+LdYcfUGUe7cHobMAskgkGqdh8W1SSf
	cb/fwxH5VzBVEusGsJMwnoE3Vj00ErmZ47C0IFAsktx+cSI7Ham4X3fAUtQg4T4NSxRJ
	Zlpg==
X-Gm-Message-State: ALoCoQkhVLQ5EKEJ783Vck8gGalS/0ehSVdiEGoyrs0Oq6uxWXWrHUz80aQYG/6YVHRDdDw/zQ9gDcn9JSt/ZEJAa3dLjitgEw==
X-Received: by 10.202.44.79 with SMTP id s76mr22607010ois.123.1453253651428;
	Tue, 19 Jan 2016 17:34:11 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	j201sm11858118oih.19.2016.01.19.17.34.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jan 2016 17:34:10 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:33:58 -0800
Message-Id: <1453253641-6309-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] valgrind cleanup + fix for armv7a without vfp/neon
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
X-List-Received-Date: Wed, 20 Jan 2016 01:34:11 -0000

Andre McCurdy (3):
  valgrind: let valgrind determine its own optimisation flags
  valgrind: re-enable ARM intdiv and vcvt_fixed_float_VFP tests
  valgrind: avoid neon for targets which don't support it

 ...d-neon-for-targets-which-don-t-support-it.patch | 33 +++++++++++
 .../valgrind/remove-arm-variant-specific.patch     | 66 ----------------------
 ...ppropriate-flags-for-vcvt-fixed-float-VFP.patch | 33 +++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb  | 12 ++--
 4 files changed, 74 insertions(+), 70 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/use-appropriate-flags-for-vcvt-fixed-float-VFP.patch

-- 
1.9.1


