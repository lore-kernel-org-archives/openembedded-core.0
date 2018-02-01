Return-Path: <cshored@thecshore.com>
X-Greylist: delayed 543 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Feb 2018 13:04:09 UTC
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id C6597783C9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 13:04:09 +0000 (UTC)
Received: from [10.50.1.148] (135-23-247-100.cpe.pppoe.ca [135.23.247.100])
	by mail.thecshore.com (Postfix) with ESMTPSA id 2310E2657
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 07:55:06 -0500 (EST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com 2310E2657
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com 2310E2657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1517489707;
	bh=EJnvguzzKIPdAmTaHghBsFzwQLhyGX/MhX9UEH3NhFw=;
	h=To:From:Subject:Date:From;
	b=E66e6fQEDR+N5o0dnOzugw3apTqkRWZjtKo058A1SjLszK3K9C6imCPuGKtoLBs+R
	pz7gB5FYdVhfP92L/gDYeXTu6h1EW9vpNvEyB8Q+0NXJHpzhLiieHe9wQ+2/o5V+F4
	RzYs/LKA6diiuNEgE8Fm0i6fOa7dzSyEwpkUlskE=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.2 at mail.thecshore.com
To: openembedded-core@lists.openembedded.org
From: "Daniel F. Dickinson" <cshored@thecshore.com>
Message-ID: <90ac077a-5126-fb99-0512-9a12851be994@thecshore.com>
Date: Thu, 1 Feb 2018 07:55:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
Subject: Adding a "tiny" DISTRO_FEATURE and having packages build smaller
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
X-List-Received-Date: Thu, 01 Feb 2018 13:04:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

Hi all,

I'm wondering if is doable and would be accepted to add a "tiny" 
DISTRO_FEATURE that automatically does PACKAGECONFIG += "tiny", and
packages which honour this make choices that build smaller editions 
and/or create smaller binary sub-packages than default (i.e. things that 
can be split out of build packages are, so that a -core or -base package 
has only the minimum, and a one uses metapackages to install expected 
packaging (so ${PN} would by default RDEPEND on ${PN}-base and other 
sub-packages (or other recipes packages/sub-packages) that give the 
'usual' use case for the package, but can be managed in parts for 
systems that are quite small.

Or is the splitting into sub-parts preferred anyway and patches to make 
smaller splits would accepted relatively easily, but usually just don't 
get done because it's more work to have more sub-packages and so it just 
doesn't get done to the level a project like OpenWrt pieces things up, 
and OpenEmbedded usually has more space available than a typical OpenWrt 
device?

I think PACKAGECONFIG[tiny] would really translate into different things 
in different packages (hence the idea of having a top-level flag that
makes it easier to do across the board rather than having to specify 
specific flags for each recipe, except in exceptional circumstances), 
although something like nossl should perhaps be a separate top-level 
flag since even if you want small you probably want some kind of ssl, 
but there may be relevant use cases where nossl would be wanted but 
isn't just about size.  With -tiny one could perhaps emphasize the 
choice of smaller SSL libraries like mbedtls and wolfssl (cyassl) when 
they are an option and warn (or refuse to build) if a big library like 
openssl can't be avoided.

I think that this is needed for e.g. poky-tiny and meta-openwrt to 
really get onto small systems.

Regards,

Daniel

