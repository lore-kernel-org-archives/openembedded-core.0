Received: from mail-oa0-f53.google.com ([209.85.219.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2nhJ-0003Sm-C9
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 19:56:50 +0100
Received: by mail-oa0-f53.google.com with SMTP id m1so567656oag.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 10:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=L8QEWUwN9qG7WsxT0unP//re1GqzRFuFzckDrf2DH38=;
	b=UdcdJ/MWuhIDnpmKvyiYeIm0bIL0YTXKorPJ9w8x7+PEx8OnOWBWMNVqDPoQ5ojhyr
	tSL2emiUv+0GCK5+AyGaAMZlBGYzdWcD9i19/EjlcMJ3LFF2lvjdfmuCnBDo8nmolZMu
	rBpYrzi4/wgLw4xaU8AfkCFWbdAoQCuyMBDpiBFGelLXc+5XPvN8dqrBXgmgt4zPamQF
	rZXB2y4hxRNdpqihPHGTLkiKFL7OsOAA8248ECFqSFo3/b264zDHldd96KOvjwWBmkTo
	vhRdousRzoLNZTVl+WDGqBonug/8ouQ8jmruzEDnd9tQaNuAaBd/pRniAtmloXb+c+ip
	fUqA==
MIME-Version: 1.0
X-Received: by 10.182.26.114 with SMTP id k18mr19140122obg.94.1360089658887;
	Tue, 05 Feb 2013 10:40:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 5 Feb 2013 10:40:58 -0800 (PST)
In-Reply-To: <511144EC.1030704@linux.intel.com>
References: <cover.1360059615.git.dvhart@linux.intel.com>
	<41381da878685b601c62d446795c38119f08941b.1360059615.git.dvhart@linux.intel.com>
	<ly7gmn57tl.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51113140.5050600@linux.intel.com>
	<lytxpq4t0n.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<511144EC.1030704@linux.intel.com>
Date: Tue, 5 Feb 2013 16:40:58 -0200
X-Google-Sender-Auth: IGUW7p37-KKJmSSb8wDfTtrsjeE
Message-ID: <CAP9ODKr1qz6=k7xC84h0Try0HsydDhNyERPzuW-FhuaLRbYajQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Darren Hart <public-dvhart-VuQAYsv1563Yd54FQh9/CA@plane.gmane.org>
Subject: Re: [PATCH 7/8] oe-git-proxy.sh: Add a new comprehensive git proxy script
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
X-List-Received-Date: Tue, 05 Feb 2013 18:56:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 5, 2013 at 3:44 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>
>
> On 02/05/2013 08:36 AM, Enrico Scholz wrote:
>> Darren Hart <dvhart@linux.intel.com> writes:
>>
>>>>> +  $NC -X connect $*
>>>>
>>>> why '$*' but not '"$@*"'?
>>>>
>>> I'm not familiar with $@*
>>
>> sorry... I meant "$@"
>>
>>
>>> As for $* versus $@, the issue is how the arguments are presented. $*
>>> as a single word, $@ each argument is quoted separately. I believe I
>>> ran into issues with $@. I haven't had any trouble with $*.
>>
>> $* is causing trouble all the time because it does not retain whitespaces
>> or empty parameters.  There are only very few cases, where $* makes sense.
>>
>>
>>> Is there a particular use case where you can see this failing as is?
>>
>> "$@" is just the right thing to do in this situation.  E.g. when your
>> script is called as
>>
>> | oe-git-proxy.sh "${HOST}" "${PORT}"
>>
>> and HOST is undefined due to some reason, you will try to connect to
>> "${PORT}" with $*.  The "$@" will cause nc to complain about the broken
>> HOST parameter.
>>
>>
>> Btw...
>>
>> | exec $NC $METHOD "$@"
>>
>> would be the school book implementation for the thing you want to do...
>>
>>
>>
>> Enrico
>
> That all makes sense. When I read up the difference again in the bash
> documentation I was surprised I had used $*, but thought I had done that
> dance already. I'll update with "$@" and do some tests.
>
> Thank you for the review and catching that.

Please give it a try in dash as well.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


