Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLu9u-0005hX-5b
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 13:09:02 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 2C340D22BC; Wed, 10 Oct 2012 12:55:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2AB0AD22BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2012 12:55:26 +0200 (CEST)
Message-ID: <50755417.3010001@linaro.org>
Date: Wed, 10 Oct 2012 12:55:19 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20121003 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CABcZANm_-4qSUXByfvn2dejfDq1EsZ-QKYpWDN_S-fK=qh19Ww@mail.gmail.com>
	<1349812886-16922-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1349822091.15658.196.camel@ted>
In-Reply-To: <1349822091.15658.196.camel@ted>
Subject: Re: [PATCH] autotools.bbclass: update gnu-config files always
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 11:09:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 10.10.2012 00:34, Richard Purdie pisze:
> On Tue, 2012-10-09 at 22:01 +0200, Marcin Juszkiewicz wrote:

>> +	# not all recipes which use autotools use it's do_configure
>> +	( for ac in `find ${S} -name configure.in -o -name configure.ac`; do
>> +		install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess `dirname $ac`
>> +		install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub   `dirname $ac`
>> +		done )

> I'm not sure we want to go down this route. How about we mandate that
> everything call autotools_do_configure but allow various sections of it
> to be optional depending on some variables.

How would we support ncurses then? It runs configure in different ways
due to ENABLE_WIDEC variable (some play with EXTRA_OECONF maybe).

Or slang which has ${S}/autoconf/configure.ac when autotools.bbclass
checks only for ${S}/configure.{in,ac} when it decides to run autoreconf?

db one is easier as there we can add some variable like SKIP_AUTORECONF
and it should work. Similar with xinetd.

> We could then trigger the above behaviour for recipes which disable
> reautoconf?

That's an option. But we need also something for situations like
slang/ncurses.

> Ideally, we should be able to reautoconf everything and we shouldn't
> have exceptions at all.

And no reset for PARALLEL_MAKE as well. But we learnt during those OE
years that there is no such thing as ideal situation.

> The aim here is to make things more deterministic and make it clear
> which code paths are being used where and why.

Agree.


