Return-Path: <max.oss.09@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id C02A56011B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2017 18:11:06 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id s203so41054732oie.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2017 10:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=i1SyRHZIusXo335VA10ggTSas/RJJV0Ff+Gll6QhMwE=;
	b=HKUE4EJQUWufKJ7Y4ukePeotGtTWKSEw7ZCIsFtkckCYSyoFgWljHQv15xFYL81I9l
	0jNCNeTWg+AEp/HR+N2ZRAPZe3nH6WhCe/Cjw4FHcQ7C+yb1lmLpsFd+VgNY3WVn9i8h
	uTF2zfNCer+a/ZLbTthGyIabazVGydIKPsuLL7uvNHySQuZFffYqawmINXip3a0tOLfp
	EqiNFkAv3Dn9PlFJGIOlVNaZrlQU/VJprdSF0AfIgBTed/sE/z9Xb0O9tLxpG60/JewX
	hYL+MEq7t8M6Fyib4j4XI5kMcVc8HOv7V6efDaIaGTe07DTw0cG7zFmjDYoIdvaHbZE/
	TpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=i1SyRHZIusXo335VA10ggTSas/RJJV0Ff+Gll6QhMwE=;
	b=G3T6J7uKc/0oCaRgSZwYZTdXpBn+Osl0QCVwd9qDbaa+OtEg5/UxM6LrNajdVHfrnb
	BLZcqmNNCir8ie5EF4pJY1wubzB1FRPZjxWMpGXk/tY2vj62BIGu868HEl3ORgA3LuhU
	9WXtTWOWBGsTBD6rTtkmePlEYY1POnLaj29DMgHKHC3lWoQ4vNFthESEnqWJSMCG8GpO
	rljpCco9QCh9uMjyqC17qdPPiaX7Gjd6ZjGot//Op4mrk7Q34BqjjM0B3DtFPqvsyaSx
	4uOxoi8kIkcqUUzukPjdkOPh4Sly8an9btJ0xhIBVfrzopeMT5dyM1jR9dLVAFIJ+J3L
	6Jpg==
X-Gm-Message-State: AMke39nmkIw1uOq+S/EIVNvgpDm/5im0Cv+NJQDw/Q4fVHcsAdl6D2k7pkajqQ+C6oqM7awcmt/B1xWFz9uILQ==
X-Received: by 10.202.102.71 with SMTP id a68mr9534940oic.106.1486923066710;
	Sun, 12 Feb 2017 10:11:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.1.56 with HTTP; Sun, 12 Feb 2017 10:11:06 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Sun, 12 Feb 2017 19:11:06 +0100
Message-ID: <CAEHkU3UMqALH-pxTZHxODCMOae-K7pO9PTYLLTsZ6U8TWDvYUw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Are RDEPENDS of depending native packages installed automatically
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
X-List-Received-Date: Sun, 12 Feb 2017 18:11:07 -0000
Content-Type: text/plain; charset=UTF-8

Hi

Should the buildsystem install RDEPENDS of depending native packages
automatically in the RSS?
I.e, if a recipe DEPENDS on a native package should all RDEPENDS of this
dependency be installed?


I stumbled over this when trying to fix crda.
crda.bb has
DEPENDS = "python-m2crypto-native python-native ..."

A recent update to python-m2crypto makes it RDEPEND on the python-typing
package.
I added to python-m2crypto recipe
RDEPENDS_${PN} += "python-typing"
(and I created the missing python-typing recipe)
and did expect that crda.bb now installs python-m2crypto-native and through
RDEPENDS python-typing-native but only python-m2crypto-native is installed.

If I explicitly add python-typing-native to the DEPENDS in the crda.bb recipe
then python-typing-native is installed and crda builds fine.


Max

