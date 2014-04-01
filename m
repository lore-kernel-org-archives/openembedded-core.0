Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0F22E6E304
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 19:07:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s31J7McL012278; Tue, 1 Apr 2014 20:07:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id suajkK2BLZZ9; Tue,  1 Apr 2014 20:07:22 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s31J7I3R012274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 1 Apr 2014 20:07:20 +0100
Message-ID: <1396379233.2910.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 01 Apr 2014 20:07:13 +0100
In-Reply-To: <CAP9ODKr29A6LKdALn6c_QVBG7v5jHcc020kva+nU9i+tC=+5ew@mail.gmail.com>
References: <1396372080-27607-1-git-send-email-otavio@ossystems.com.br>
	<1396374798.2910.29.camel@ted>
	<CAP9ODKr29A6LKdALn6c_QVBG7v5jHcc020kva+nU9i+tC=+5ew@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] oe.utils, utils.bbclass: Add any_contains and base_any_contains
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
X-List-Received-Date: Tue, 01 Apr 2014 19:07:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-01 at 15:38 -0300, Otavio Salvador wrote:
> On Tue, Apr 1, 2014 at 2:53 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2014-04-01 at 14:07 -0300, Otavio Salvador wrote:
> >> This is similar to the contains but matches any of values. This is
> >> useful to match for example several DISTRO_FEATURES which ought to
> >> include a PACKAGECONFIG option.
> >>
> >> For example:
> >>
> >> PACKAGECONFIG ??= "${@base_any_contains('DISTRO_FEATURES', 'x11 wayland', 'gtk+', '', d)}"
> >>
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> ---
> >>  meta/classes/utils.bbclass |  3 +++
> >>  meta/lib/oe/utils.py       | 13 +++++++++++++
> >>  2 files changed, 16 insertions(+)
> >>
> >> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> >> index 0a533af..966eda1 100644
> >> --- a/meta/classes/utils.bbclass
> >> +++ b/meta/classes/utils.bbclass
> >> @@ -26,6 +26,9 @@ def base_version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
> >>  def base_contains(variable, checkvalues, truevalue, falsevalue, d):
> >>      return oe.utils.contains(variable, checkvalues, truevalue, falsevalue, d)
> >>
> >> +def base_any_contains(variable, checkvalues, truevalue, falsevalue, d):
> >> +    return oe.utils.any_contains(variable, checkvalues, truevalue, falsevalue, d)
> >> +
> >>  def base_both_contain(variable1, variable2, checkvalue, d):
> >>      return oe.utils.both_contain(variable1, variable2, checkvalue, d)
> >>
> >> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> >> index defa536..029d713 100644
> >> --- a/meta/lib/oe/utils.py
> >> +++ b/meta/lib/oe/utils.py
> >> @@ -54,6 +54,19 @@ def contains(variable, checkvalues, truevalue, falsevalue, d):
> >>          return truevalue
> >>      return falsevalue
> >>
> >> +def any_contains(variable, checkvalues, truevalue, falsevalue, d):
> >> +    val = d.getVar(variable, True)
> >> +    if not val:
> >> +        return falsevalue
> >> +    val = set(val.split())
> >> +    if isinstance(checkvalues, basestring):
> >> +        checkvalues = set(checkvalues.split())
> >> +    else:
> >> +        checkvalues = set(checkvalues)
> >> +    if checkvalues in val:
> >> +        return truevalue
> >> +    return falsevalue
> >> +
> >>  def both_contain(variable1, variable2, checkvalue, d):
> >>      if d.getVar(variable1,1).find(checkvalue) != -1 and d.getVar(variable2,1).find(checkvalue) != -1:
> >>          return checkvalue
> >
> > A more logical name is perhaps containsany().
> >
> > I'd also add that bitbake has special support for contains() and
> > optimises sstate hashes for its use. We don't have such optimisation for
> > containsany(). I think this is perhaps 1.7 material at this point.
> 
> I'd use contains_any. Any problem with this?
> 
> I didn't find the place bitbake handles it. Can you point the
> reference for me to look at it and complete this?

It starts at lib/bb/codeparser.py:

   containsfuncs = ("bb.utils.contains", "base_contains", "oe.utils.contains")

and then that data gets passed around in various caches and so one and
is eventually used in the checksum dependencies.

Cheers,

Richard





