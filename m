Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B3B156059A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jun 2014 08:35:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5S8ZNUW027301; Sat, 28 Jun 2014 09:35:23 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6vQt1zaPs2xC; Sat, 28 Jun 2014 09:35:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5S8ZHDY027297
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 28 Jun 2014 09:35:18 +0100
Message-ID: <1403944509.28648.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <tom.rini@gmail.com>
Date: Sat, 28 Jun 2014 09:35:09 +0100
In-Reply-To: <20140627151709.GU9006@bill-the-cat>
References: <1403785652-17065-1-git-send-email-tom.rini@gmail.com>
	<1403876444.28648.9.camel@ted> <20140627141649.GT9006@bill-the-cat>
	<1403880870.28648.11.camel@ted> <20140627151709.GU9006@bill-the-cat>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Ensure IMAGE_FSTYPES is fully evaluated before live/live logic
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
X-List-Received-Date: Sat, 28 Jun 2014 08:35:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-06-27 at 11:17 -0400, Tom Rini wrote:
> On Fri, Jun 27, 2014 at 03:54:30PM +0100, Richard Purdie wrote:
> > I wondered about that but I did already check and:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/utils.py
> > 
> > def contains(variable, checkvalues, truevalue, falsevalue, d):
> >     val = d.getVar(variable, True)
> > 
> > so it is being expanded afaict...
> 
> Yeah, but what does that expand back to?  My bitbake internals-fu is
> weak, but:
> $ git grep def\ getVar
> lib/bb/command.py:    def getVariable(self, command, params):
> lib/bb/data.py:def getVar(var, d, exp = 0):
> lib/bb/data.py:def getVarFlag(var, flag, d):
> lib/bb/data.py:def getVarFlags(var, d):
> lib/bb/data_smart.py:    def getVar(self, var, expand=False, noweakdefault=False
> lib/bb/data_smart.py:    def getVarFlag(self, var, flag, expand=False, noweakdef
> lib/bb/data_smart.py:    def getVarFlags(self, var, expand = False, internalflag
> 
> So where do we map back to a 'getVar' that takes expand as arg 2 not arg
> 3?

Its calling:

lib/bb/data_smart.py:    def getVar(self, var, expand=False, noweakdefault=False

since d is a data store object which becomes "self", the first argument
and the other two are then passed in with expand = True.

The bb.data.getVar(d, var, expand) syntax is just clumsy and deprecated
when you can write the same thing as d.getVar(var, expand).

Cheers,

Richard



