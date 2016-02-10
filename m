Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF61731F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 14:44:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1AEiE0k020321
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Feb 2016 06:44:14 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 10 Feb 2016 06:44:14 -0800
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1455008560.git.jussi.kukkonen@intel.com>
	<aae55470a8d782e166fc6135ceb03631e1346429.1455008560.git.jussi.kukkonen@intel.com>
	<b4d964e733159d37952d2f1f6f4d9bbdbad24979.1455008560.git.jussi.kukkonen@intel.com>
	<CAP71WjxybQ+N3N-+pOzLo7jQdJ=F0TVwVEoFihAn_96TG-q=7g@mail.gmail.com>
	<4DE97B9F-591B-4298-9F48-48B09D1B4B79@gmail.com>
	<56BA2A15.2060706@windriver.com>
	<CAHiDW_GPu1LrmHnBVCqsCXm7MGCxwESoejb57zaqSG1HQAjwWw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56BB4CBD.4070207@windriver.com>
Date: Wed, 10 Feb 2016 08:44:13 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAHiDW_GPu1LrmHnBVCqsCXm7MGCxwESoejb57zaqSG1HQAjwWw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] xserver-xorg: Add PACKAGECONFIG for crypto libraries
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
X-List-Received-Date: Wed, 10 Feb 2016 14:44:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/10/16 2:25 AM, Jussi Kukkonen wrote:
> On 9 February 2016 at 20:04, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     On 2/9/16 11:54 AM, Khem Raj wrote:
>     >
>     >> On Feb 9, 2016, at 1:39 AM, Nicolas Dechesne <nicolas.dechesne@linaro.org <mailto:nicolas.dechesne@linaro.org>> wrote:
>     >>
>     >> On Tue, Feb 9, 2016 at 10:24 AM, Jussi Kukkonen
>     >> <jussi.kukkonen@intel.com <mailto:jussi.kukkonen@intel.com>> wrote:
>     >>> Default to libcrypto (openssl) as before.
>     >>>
>     >>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com <mailto:jussi.kukkonen@intel.com>>
>     >>
>     >> Looks good to me. this is the same implementation I used in the mesa
>     >> patch.. so we need to make sure that any review feedback is applied to
>     >> both before merging the too,
>     >
>     > since its spans multiple recipes would it be better to control it with
>     > a global knob instead of packageconfig.
> 
>     I'm not sure it makes sense in -this- case..  but I've more then once thought
>     that it would be nice for a global distro "this is the preferred crypto engine"
>     setting.
> 
>     That way you could do things like default to openssl, libgcrypt, libnss, etc..
>     whatever is appropriate for the system you are building.  It wouldn't promise
>     that everything would just use that crypto backend, but things that could --
>     should.
> 
> 
> I was wondering if something like this was possible as well: that's how I got
> into reviewing the reverse dependencies of openssl & gnutls. 
> 
> There are some cases that might make this effort not worth the trouble: SHA1 is
> easy and switching implementations is something upstream projects want to
> support but with e.g. TLS it is not always so: An example is glib-networking
> with only gnutls for TLS support*.

This is why I suggest it isn't an all or nothing, but instead a hint for the
recipes that support multiple crypto backends.

In one of my products, we use OpenSSL (w/ the FIPS module) as the primary crypto
engine for the system.  We had to configure a number of recipes/packageconfig
settings to use OpenSSL as the primary crypto engine.

It would have been much easier to just set a single distribution setting and
then update the recipes to pay attention to the single setting.

--Mark

> Jussi
> 
> 
> *) There's a "wip/openssl" branch of glib-networking so this might get fixed in
> future releases .
> 
> 
> 
>     (This is certainly a more extensive patch then what's being discussed here..)
> 
>     --Mark
> 
>     >> should we get any review feedback.. but
>     >> in any case:
>     >>
>     >> Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org
>     <mailto:nicolas.dechesne@linaro.org>>
>     >> --
>     >> _______________________________________________
>     >> Openembedded-core mailing list
>     >> Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     >
>     >
>     >
> 
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 


