Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SSE8t-0007rP-GB for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 23:09:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49L00Ae026118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 22:00:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25763-02 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2012 21:59:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49KxprA026112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 21:59:52 +0100
Message-ID: <1336597189.2494.80.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 May 2012 21:59:49 +0100
In-Reply-To: <24944576961308660582b4a62b2c609fcef0bcea.1335922726.git.peter.seebach@windriver.com>
References: <cover.1335922726.git.peter.seebach@windriver.com>
	<24944576961308660582b4a62b2c609fcef0bcea.1335922726.git.peter.seebach@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] sanity.bbclass: Check for bogus values in BBCLASSEXTEND
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
X-List-Received-Date: Wed, 09 May 2012 21:09:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-01 at 20:45 -0500, Peter Seebach wrote:
> Suggestion that came out of my sanity-checks of multilibs; verify
> that stuff in BBCLASSEXTEND is valid.
> 
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> ---
>  meta/classes/sanity.bbclass |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 635049e..9f3f1d5 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -81,6 +81,15 @@ def check_toolchain(data):
>  
>      return ""
>  
> +def check_bbclassextend(data):
> +    allowed = ('native', 'nativesdk', 'multilib', 'cross')
> +    extends = (data.getVar("BBCLASSEXTEND", True) or "").split()
> +    errors = []
> +    for pair in [x.split(':') for x in extends]:
> +        if pair[0] not in allowed:
> +            errors.append('BBCLASSEXTEND has invalid value: %s' % pair[0])
> +    return '\n'.join(errors)
> +
>  def check_conf_exists(fn, data):
>      bbpath = []
>      fn = data.expand(fn)
> @@ -401,6 +410,10 @@ def check_sanity(e):
>      if toolchain_msg != "":
>          messages = messages + toolchain_msg + '\n'
>  
> +    bbclassextend_msg = check_bbclassextend(e.data)
> +    if bbclassextend_msg != "":
> +        messages = messages + bbclassextend_msg + '\n'
> +
>      # Check if DISPLAY is set if IMAGETEST is set
>      if not data.getVar( 'DISPLAY', e.data, True ) and data.getVar( 'IMAGETEST', e.data, True ) == 'qemu':
>          messages = messages + 'qemuimagetest needs a X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n'

FWIW, this isn't going to work. Its checking the sanity in
"configuration" space, pre recipe parse so it won't pick up on the
errors we want it to.

So whilst its well intentioned, it isn't going to work as designed and
we'll have to rethink it. I can't think of a good way to fix it right
now, we don't really have a structure for recipe checks at this point.

Cheers,

Richard



