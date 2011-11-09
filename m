Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RO6oI-0001Tz-7S for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 12:59:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA9Br3pY015005
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 11:53:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14395-03 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2011 11:52:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA9BqsQs014997
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 11:52:55 GMT
Message-ID: <1320839575.10843.165.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 09 Nov 2011 11:52:55 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: bb.data.*Var -> d.*Var conversion
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
X-List-Received-Date: Wed, 09 Nov 2011 11:59:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm tempted to run the following over the metata to convert the
bb.data.*Var(...,d) and similar expressions to the form d.*Var(...).

Why? We get a lot of people doing copy, paste and edit of the code and
this way, we'll increase the chances of them finding better examples.

I'm still looking at the diff this generates to see if there are any
more corner cases I need to tweak the expression for but feedback
welcome.

sed \
-e 's:bb.data.\(setVar([^,]*,[^,]*\), \([^ )]*\) *):\2.\1):g' \
-e 's:bb.data.\(setVarFlag([^,]*,[^,]*,[^,]*\), \([^) ]*\) *):\2.\1):g' \
-e 's:bb.data.\(getVar([^,]*\), \([^, ]*\) *,\([^)]*\)):\2.\1,\3):g' \
-e 's:bb.data.\(getVarFlag([^,]*,[^,]*\), \([^, ]*\) *,\([^)]*\)):\2.\1,\3):g' \
-e 's:bb.data.\(getVarFlag([^,]*,[^,]*\), \([^) ]*\) *):\2.\1):g' \
-e 's:bb.data.\(getVar([^,]*\), \([^) ]*\) *):\2.\1):g' \
-i `grep -ril bb.data *`

Cheers,

Richard



