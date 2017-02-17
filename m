Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id B6F2871985
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 07:26:00 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id 203so9791689ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 23:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=40yZustmJecwjv/Tr61Fnicd6JuBsjfl1qQ4GA5hxgA=;
	b=wUNa1JMnZGs/7FO+L6J92ANRPZkqlH9N89IU+xmwwErB56x/PoiLwhLBnIJ98iT6lt
	MPLT9EmZsMutxlO2NvtAP7BZgrOlcU9q27Q7v5bUcMO4J2Qq/HguHtoKCA+NiGHrdMJr
	3U59ypGC1+IWCjGJTkSOIIC8O3iCuy1W9E7WF7ZgSzcP5RBLXm5JN3p/PvJhV6WeXihK
	2gL538jUfzUO1pDDEi4KzsIv1S17vuybKErFIAkO38dUBpNK18MWpJJ9vGYq/NFWifcs
	xffj2BCnAw1paAaxXvvyyNV7sNwWn/dX4LJTkFbwwqdzi0kWH2SWmBywt6Se4b1xKZ2T
	KVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=40yZustmJecwjv/Tr61Fnicd6JuBsjfl1qQ4GA5hxgA=;
	b=Hm34GSKUpSZZfVY8nmkCNHMs+QiR6PHchhaV9GXZ/8JadY71Get7RMm0wuMTmdciJw
	ZPquGlHgChiFwhHCqogEGDCgQaaByNsMt3jx2B3aZGaavDnE9/5GXk3lEwiAzUBnJNvp
	tyfHZrRpVdfDUGBk++S/mHpQocRM13h221dfBc3tyRTCikYUJ6iruFrgDMQeWS/J60HR
	d/6dC3h7dBMyxTbmUHC6E3h23W4kA3k3aVP1T7rixX0qsC8QRxERpvX8VWvbgaUToZfD
	utCyBcEqZUpGJB7MoJgeIHpLW/YcqmvQHUjebtFn0ORrXf7djd0+oz4gzspa2RWD0QKo
	12Ow==
X-Gm-Message-State: AMke39kiEnoi0qz3YQeGg42O9lRH0J6bftaNz50UvXVxxTBFsxMZ+hD54Ypga5n940l9MQz0
X-Received: by 10.107.185.212 with SMTP id j203mr7454577iof.226.1487316360712; 
	Thu, 16 Feb 2017 23:26:00 -0800 (PST)
Received: from pohly-mobl1 (p5DE8FD56.dip0.t-ipconnect.de. [93.232.253.86])
	by smtp.gmail.com with ESMTPSA id 20sm4334171iof.26.2017.02.16.23.25.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Feb 2017 23:25:59 -0800 (PST)
Message-ID: <1487316357.13854.504.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 17 Feb 2017 08:25:57 +0100
In-Reply-To: <1487288761-22432-1-git-send-email-sgw@linux.intel.com>
References: <1487288761-22432-1-git-send-email-sgw@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] native.bbclass: populate native recipe with it's files
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
X-List-Received-Date: Fri, 17 Feb 2017 07:26:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-02-16 at 15:46 -0800, Saul Wold wrote:
> This allows a native package's recipe-sysroot-native to be populated with
> that packages native image files.  This in turns allows it to be used by
> scripts or other tools without creating un-necessary DEPENDS.
> 
> An example of this is systemtap-native and the crosstap script.

The intended usage wasn't clear to me at first. I think it is something
like "bitbake foobar-native" and then calling foobar's tools directly
from tmp/work/*/foobar-native/*/recipe-sysroot-native (?).

If true, then any recipe intending to be used like that also needs to
exclude itself from do_rm_work:
RM_WORK_EXCLUDE += "${PN}"

Or perhaps more selectively exclude the RSS:
RM_WORK_EXCLUDE_ITEMS += "recipe-sysroot-native" (is there a variable
for this name?)

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




