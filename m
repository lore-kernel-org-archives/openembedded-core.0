Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SwIu4-00009J-Ku
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 22:18:52 +0200
Received: by ggnp4 with SMTP id p4so5861423ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 13:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=lCL7IWO0IAr4PbB/06HZnrVEmHXwnhBEpYQZLPdaTaI=;
	b=j7tB9B2X2oEcopmPLaE1mu8Wb/9afgQwx+tLKLy3hcvXB3YRqf9JbB6t8+DDHf5FMG
	KJFaa+6TCZbv4tHIdKggD4MrFFIu6G7/Hl1+RVZQbtJVLstQpGTwwTFKrFeHcz5mkjDO
	GrtFlnEQ6AGOqDGELdlMy/6aiVK0fu5C3zZwZibR/IQYoN0M5ex+UQxkru5errGNyClo
	aP5GQ9E97YM60B9pHx7kd2DuWCsbag7CdNhI5DumLQGmPSSv2wmzBJgxieyy2Wf0iAoN
	2L9H625aFA1kO3e7oUeO4Lbl8wPBsuD/U79n6dAzCftj3tTv2kkQdeHIdj2jJ3ou/Doc
	Myiw==
MIME-Version: 1.0
Received: by 10.50.203.41 with SMTP id kn9mr3084937igc.72.1343765234523; Tue,
	31 Jul 2012 13:07:14 -0700 (PDT)
Received: by 10.231.239.131 with HTTP; Tue, 31 Jul 2012 13:07:14 -0700 (PDT)
In-Reply-To: <50183924.8010309@windriver.com>
References: <CALRxmdDhE8GQPYde27786kKU35p4dRrTmaGbmauVDxTrMQ6N6Q@mail.gmail.com>
	<50183924.8010309@windriver.com>
Date: Tue, 31 Jul 2012 16:07:14 -0400
Message-ID: <CADkTA4N_mFVkWx7G=E8BoCDYktkNXxO-zLrw_r9e0sO-wE5FjQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: static busybox?
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
X-List-Received-Date: Tue, 31 Jul 2012 20:18:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 31, 2012 at 3:59 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 7/31/12 1:14 PM, Stuart Yoder wrote:
>>
>> We are doing some work with LXC (containers) and one of the templates
>> is for busybox.  For LXC, the busybox package needs to be built statically
>> and
>> there is a config option for this.
>>
>> A couple possible approaches:
>>
>>     -create a new 'busybox_static' recipe that the lxc package
>>      depends on that turns on the needed build options.   Pretty
>>      straightforward, but now there are 2 variants of the busybox
>>      package.
>>
>>     -somehow propagate some configuration options through to
>>      the standard busybox recipe so it turns on the config
>>      option to build things statically.   Not sure how to
>>      do this, and seems like it could get pretty messy.
>>
>> Any thoughts?
>
>
> We've been talking about this as well..  I'm currently of the opinion that
> the kernel's config fragement processing be added to busybox.  This way
> someone can simply add a configuration fragment via a bbappend, or other
> approach and it'll pick it up.   That same can be used to specify how to
> enable other optional pieces of busybox.

merge_config.pl can be yanked out of the kernel source tree (it's upstream) and
packaged as something for use by busy box.

I wouldn't recommend all the scaffolding that the kernel has (it's
overkill, since
there are more configs, patches and git manipulations in play for the
kernel), but a\
simple scheme to collect the fragments from the SRC_URI and fire them through
merge_config.pl would be a pretty simple python routine.

Cheers,

Bruce

>
> --Mark
>
>
>> Thanks,
>> Stuart Yoder
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


