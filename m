Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ROISH-00075x-0O for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 01:25:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAA0J50c021926
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 00:19:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21787-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 00:19:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAA0Ixqg021889
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 00:19:00 GMT
Message-ID: <1320884340.10843.252.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2011 00:19:00 +0000
In-Reply-To: <1320839575.10843.165.camel@ted>
References: <1320839575.10843.165.camel@ted>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: bb.data.*Var -> d.*Var conversion
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
X-List-Received-Date: Thu, 10 Nov 2011 00:25:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-09 at 11:52 +0000, Richard Purdie wrote:
> I'm tempted to run the following over the metata to convert the
> bb.data.*Var(...,d) and similar expressions to the form d.*Var(...).
> 
> Why? We get a lot of people doing copy, paste and edit of the code and
> this way, we'll increase the chances of them finding better examples.
> 
> I'm still looking at the diff this generates to see if there are any
> more corner cases I need to tweak the expression for but feedback
> welcome.
> 
> sed \
> -e 's:bb.data.\(setVar([^,]*,[^,]*\), \([^ )]*\) *):\2.\1):g' \
> -e 's:bb.data.\(setVarFlag([^,]*,[^,]*,[^,]*\), \([^) ]*\) *):\2.\1):g' \
> -e 's:bb.data.\(getVar([^,]*\), \([^, ]*\) *,\([^)]*\)):\2.\1,\3):g' \
> -e 's:bb.data.\(getVarFlag([^,]*,[^,]*\), \([^, ]*\) *,\([^)]*\)):\2.\1,\3):g' \
> -e 's:bb.data.\(getVarFlag([^,]*,[^,]*\), \([^) ]*\) *):\2.\1):g' \
> -e 's:bb.data.\(getVar([^,]*\), \([^) ]*\) *):\2.\1):g' \
> -i `grep -ril bb.data *`

Incidentally this is worth about a 1.5% increase in parsing speed which
makes sense since it removed one level of function indirection.

Cheers,

Richard



