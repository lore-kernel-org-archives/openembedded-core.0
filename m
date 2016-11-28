Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA3971B2C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 16:13:07 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u144so19765473wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 08:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pcjcir3zfbrXfaW0qOf1HfZ9GIEWuKot27kcdOOr9AI=;
	b=x3pr4HqnYiC7VJUWQBUVRbLkcSRjJ3FRhY7nQcGUsGVQG7SLYTF83BGSlcp5YEDbwO
	x3fg0wFtBLoARFHGkUebLgaG25o7gVkYaJOmSkYf1EzCVg2iB9h7dKTPmOrIB7+q1ulv
	WXukihOe/g0ukMzKyb378XlmXPRgsKmzIwUCafspdVJw03WBUqrFKlUfEjlCRGAlWJF/
	Ch4HNBRmhnRNyt0lWb+qTyuIcPNqgzGY01afMILxbmP4owKVsxkrhB9uC/V4foMbXvpz
	yf6WFMxwdPhIk+4Da1RJfhYJ45J84/rnuJVvRn+QOeW1lXWhSToUhFK+LPExvx5G5DIO
	5eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pcjcir3zfbrXfaW0qOf1HfZ9GIEWuKot27kcdOOr9AI=;
	b=SEFXbLy0OA5DkMOBlD0j4Zyrp+PmF6tsdaKqva4tsnOTvIW0CvN9XMve7qiZUm5eXS
	2tD/CfyiVeBYkz017NLiXWck8Z2KHsD/Fdtda7e6fnNa+iVj0Km5gtDu4PiM7TFGCT5P
	VtLgst/GIsacKvAmvqFm7E0VlfuNJWHJQTYE9B0fOF8SU4ek5EptWB6PHAJf37Tzzr2U
	7H6f1bYKvJv+is9+ALCf7amayOxmulYs24jKtxQz96c8dQuu+7BPL10IGKhWYaRB5vSU
	+weCkEyDsxnmhBg05XKexODrSBQR1dsD5SGFpCMOaQcMC7OEq3671QRVxmwoIGq/q6TQ
	bnew==
X-Gm-Message-State: AKaTC03/4KEBy36T2xRoalJXeNqFAzd4iTW/Y9T7WHptwlwSMUxAKZAJ5iMHigNpz1c9jw==
X-Received: by 10.28.31.23 with SMTP id f23mr21085425wmf.94.1480349588071;
	Mon, 28 Nov 2016 08:13:08 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	u81sm29561114wmu.10.2016.11.28.08.13.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 08:13:07 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org, haris.okanovic@ni.com,
	markus.lehtonen@linux.intel.com
Date: Mon, 28 Nov 2016 17:11:49 +0100
Message-Id: <20161128161150.28655-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161124092636.9533-1-freesilicon@gmail.com>
References: <20161124092636.9533-1-freesilicon@gmail.com>
Subject: [PATCH v4] classes: Fix alternatives and rc.d ordering
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
X-List-Received-Date: Mon, 28 Nov 2016 16:13:12 -0000


Changes since v3:
	* Count the number of lines produced by update-alternatives to detect if
	  lines were inserted. Failing to do so introduced bugs in native
	  packages (e.g. binutils-cross-canadian-arm)

