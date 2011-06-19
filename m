Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1QYJay-0003et-8S
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Jun 2011 17:07:28 +0200
Received: by pzk36 with SMTP id 36so3323661pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2011 08:03:56 -0700 (PDT)
Received: by 10.68.46.65 with SMTP id t1mr1695336pbm.231.1308495835325;
	Sun, 19 Jun 2011 08:03:55 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-204-11.hsd1.ca.comcast.net
	[67.187.204.11])
	by mx.google.com with ESMTPS id k4sm2660557pbl.27.2011.06.19.08.03.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 19 Jun 2011 08:03:54 -0700 (PDT)
Message-ID: <4DFE0FD9.4010400@mvista.com>
Date: Sun, 19 Jun 2011 08:03:53 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Lightning/1.0b2 Thunderbird/3.1.10
	ThunderBrowse/3.3.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1308365562.git.josh@linux.intel.com>
	<f0a7d48483260e9251d74216d7569de1a029d035.1308365562.git.josh@linux.intel.com>
In-Reply-To: <f0a7d48483260e9251d74216d7569de1a029d035.1308365562.git.josh@linux.intel.com>
X-Enigmail-Version: 1.1.1
Subject: Re: [RFC PATCH 2/2] sanity: implement network connectivity test
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Jun 2011 15:07:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


> +    test_uris= ["http://yoctoproject.org/about",
> +                "https://eula-downloads.yoctoproject.org/crownbay/crownbay-bernard-5.0.0",
> +                "git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=HEAD"]
> +    retval = ""

These should probably be set as setable from the meta data. It is a
reasonable default, but hard coding it with out a way to change it is
probably not what we want.

> +
> +    # Only check connectivity if network and this check enabled
> +    # Because it's a fairy heavy test allow disabling of just this sanity test
> +    # by setting DISABLE_NETWORK_SANITY
> +    data = bb.data.createCopy(d)
> +    network_disabled = not bb.data.getVar('BB_NO_NETWORK', data, True)
> +    check_disabled = bb.data.getVar('DISABLE_NETWORK_SANITY', data, True)
> +    if check_disabled or network_disabled:

Completely minor gnit. The copy here isn't needed until you start
setting the DL_DIR. Why not wait til after the check to see if we need
to do it.

Otherwise seem like a solid idea.

-- 
Jeremy Puhlman
Montavista Sofware, LLC.


