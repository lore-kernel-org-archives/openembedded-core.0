Received: from mail-oa0-f42.google.com ([209.85.219.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UFOj7-0001wa-13
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 13:54:47 +0100
Received: by mail-oa0-f42.google.com with SMTP id i18so5705214oag.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 05:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=c+gHXmmaCVINMp+i5VWJlllgqSkr/OzSWjb2Y51WR+4=;
	b=rckFo356eI+ZKoGSKRFLsgN7mgIkFbbGDz0F1X5ePbvYPfDdOJVWD8c/GziHm2j7y6
	gdIHaQq4lJ/EXZDGosHPchauEvAQTlBZVG+fzX+0FX5WL+oX5tx594Af5Okus/poSWGd
	0ZLCJg5Ursqy8HVe+T+svSYwXqY2x/p1d+CE8TsrTBnahRObRFjhKlekNgpJkh7und7P
	CWuEKIAGj9X1A7RJrhq13i8rA/+WdvVbUDaKQ8zJ1J1eH+FO9iPmFPFRSKatUOZoZuY4
	gebhrt+movAMFtntVvEohncNtEz15SGYyJyhpql3Pr1pJokzKfRSsa85VxqkpAZE++Lm
	hvZw==
MIME-Version: 1.0
X-Received: by 10.182.88.103 with SMTP id bf7mr11993340obb.7.1363091885289;
	Tue, 12 Mar 2013 05:38:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Tue, 12 Mar 2013 05:38:04 -0700 (PDT)
In-Reply-To: <1363069177.9859.1.camel@ted>
References: <1362765064-27663-1-git-send-email-Chase.Maupin@ti.com>
	<CAP9ODKphM_vr-CgBbpm60tQixxepsCcMN60yGwofnhSRhrm-kA@mail.gmail.com>
	<20130308200628.GB15481@denix.org>
	<CAP9ODKreEY23jZvHhQGPa27EJdH85JzH9_QmWMNU+w7aQ9u_+A@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015944E4E0@DLEE12.ent.ti.com>
	<CAP9ODKrnp4VHmvOyq-D=k1oy62VT0R18Xk1KS80kAD+4JfqLJQ@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED101594532C3@DLEE12.ent.ti.com>
	<CAP9ODKog6e+3BbDT+pLy1a8GsEuKtyZmuuoHGoc3tOX20OvLpg@mail.gmail.com>
	<1363069177.9859.1.camel@ted>
Date: Tue, 12 Mar 2013 09:38:04 -0300
X-Google-Sender-Auth: Uc8bSmGEnuOZYtcRNnMA93770QU
Message-ID: <CAP9ODKr2+DoLbT-san4bXMOcKqAPCFA_SUuH3SxsnnABQd11gw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] soc-family: fix SOC_FAMILY override order
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
X-List-Received-Date: Tue, 12 Mar 2013 12:54:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 12, 2013 at 3:19 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2013-03-11 at 13:24 -0300, Otavio Salvador wrote:
>> On Mon, Mar 11, 2013 at 11:49 AM, Maupin, Chase <chase.maupin@ti.com> wrote:
>> >> On Fri, Mar 8, 2013 at 7:16 PM, Maupin, Chase
>> >> We can have more generic to more specific combinations.
>> >>
>> >> > Or are you trying to build something like omap3->am35xx->am3517
>> >> where you can use omap3 as a more generic setting but still use
>> >> am35xx for a slightly more restrictive group that is still
>> >> grouping like parts, and finally you use am3517 for the exact
>> >> part?
>> >>
>> >> Exactly so we avoid duplication stuff to boards or SoCs. Another
>> >> example of use: imx -> mx6q -> mx6.
>> >
>> > I see.  This could be of some use and I'll play with it.  This
>> should not be required though for this patch since right now I want to
>> fix the order issue.  Any objection to the patch as is?
>>
>> No; not really. I just wanted to ask if you could look at it as well
>> so we can have it working. It does make things much easier for all us.
>
> As pointed out this already merged.
>
> I'd also point out that you can use MACHINEOVERRIDES directly to specify
> additional machine overrides so I'm not sure there is much extra
> complexity here that is really needed.

Yes I can do it using machine overrides but it does seem to be clear
for someone reading the code if it is included in SOC_FAMILY.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


