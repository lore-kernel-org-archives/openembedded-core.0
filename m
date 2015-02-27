Return-Path: <openembedded-devel@urbanec.net>
Received: from mail14.tpgi.com.au (mail14.tpgi.com.au [203.12.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id B493872667
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 13:47:34 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Sat, 28 Feb 2015 00:47:29 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail14.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id t1RDlRAK030548
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Sat, 28 Feb 2015 00:47:29 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <openembedded-devel@urbanec.net>)
	id 1YRLGJ-0000x6-5D; Sat, 28 Feb 2015 00:47:27 +1100
Message-ID: <54F0756E.7020205@urbanec.net>
Date: Sat, 28 Feb 2015 00:47:26 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1424210642.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1424210642.git.alejandro.hernandez@linux.intel.com>
Subject: Re: [PATCH v2 0/1] Python: Upgrade from 2.7.3 to 2.7.9
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
X-List-Received-Date: Fri, 27 Feb 2015 13:47:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Just a couple of observations on this upgrade:

1. Python 2.7.9 now does strict SSL certificate checking as per 
http://www.python.org/dev/peps/pep-0476/ and as a result I had at least 
one package break due to:

[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:581)

I managed to fix that issue by switching the source URL from https:// to 
http:// Although this change in behaviour is desirable in the grand 
scheme of things, it is likely to cause some pains along the way.

2. python-imaging build just locks up for me. I don't know what's wrong. 
I tried an strace but all I can see is a python process waiting on a futex.

I think it may be a good idea to keep python 2.7.3 packages in oe-core 
because a move from 2.7.3 to 2.7.9 is likely to break some systems. At 
least in terms of item 1, we have a large potential for breakage, since 
the SSL cert checking will break anything that uses self-signed SSL 
certs for HTTPS without deploying the correct CA to the client systems. 
As far as I can tell, there is no system wide override for this behaviour.


