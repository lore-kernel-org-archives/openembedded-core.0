Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id B742B6B0A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 17:52:00 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id wo10so5673862obc.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 10:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=/LsAxZ2cVjEfIYHaU2ZMaZVNwlIQqioJ4XzbcANdW58=;
	b=NM9ljXp9Osi1be0pvvBhNcMhGFihLXNt+UYtbKb+jG6iRhEJe5AfGnfA5xMo9fVs5O
	DvU0sgj9+F7OlogWz7sP0UD97NZc5dJDIJP+/B4PhFZJy7lvS3MtqTYsgECB61jtoSUz
	UoZKLXMS1bMmK1xNtxNBDLkAQfH8+jnr6aYl2VYOl+ecoecGPHVVgVk/k6oywTCOzxXO
	SpKDhfyG0Rl0Wyz4LuBqFM2CVoVeb+5Ss/EZ0y+YWntpvYexR1SvO+Ttgs9O6cwijl3w
	Yv6a3XlgGZsEsmtjHfdarnvBxRzFhYsxkhE36zPt0vOAcm7jo5vJK7sc+oC6MGk1uYRo
	Hzpg==
MIME-Version: 1.0
X-Received: by 10.60.55.196 with SMTP id u4mr18692448oep.57.1374256320338;
	Fri, 19 Jul 2013 10:52:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Fri, 19 Jul 2013 10:52:00 -0700 (PDT)
In-Reply-To: <CAP71WjyRkp0TM9vLfX6jFG-E6TWZuUjZeUTSnEefvJA1VOb5yA@mail.gmail.com>
References: <1374223150-16033-1-git-send-email-andre.draszik@linaro.org>
	<CAP71WjyRkp0TM9vLfX6jFG-E6TWZuUjZeUTSnEefvJA1VOb5yA@mail.gmail.com>
Date: Fri, 19 Jul 2013 14:52:00 -0300
X-Google-Sender-Auth: -WQxdzeqmHOI-u7p0hZ39jfR-e4
Message-ID: <CAP9ODKrysra+zBOTmpYiMMoaoM2gfXqJDRKE1PNa2YNzWpPRxg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	"Eggleton, Paul" <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] directfb: don't patch pkg-config files
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
X-List-Received-Date: Fri, 19 Jul 2013 17:52:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2013 at 11:46 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> On Fri, Jul 19, 2013 at 10:39 AM, Andr=E9 Draszik <andre.draszik@linaro.o=
rg>
> wrote:
>>
>> We are currently getting build failures of projects that rely on
>> being able to access DirectFB's internal include directories, as
>> returned via pkg-config, since the include paths returned by
>> pkg-config are incomplete.
>>
>> The reason for that is the patch that is being removed with this
>> change. It modified the cflags returned by pkg-config in an
>> incorrect way, causing us to miss important include paths:
>>
>> For reference, pkg-config output with incorrect patch applied:
>>   ad@bril0118 #513 ~> pkg-config --cflags directfb-internal
>> -D_GNU_SOURCE -D_REENTRANT
>> -I<builddir>/tmp/sysroots/<machine>/usr/include/directfb
>> -I<builddir>/tmp/sysroots/<machine>/usr/include
>>
>> Now, with the incorrect patch removed, the output is as expected:
>>   ad@bril0118 #514 ~> pkg-config --cflags directfb-internal
>> -D_GNU_SOURCE -D_REENTRANT
>> -I<builddir>/tmp/sysroots/<machine>/usr/include/directfb-internal
>> -I<builddir>/tmp/sysroots/<machine>/usr/include/directfb
>>
>> Overall, the removed patch is not needed - pkg-config does the right
>> thing these days and we can simply use the correctly working upstream
>> versions of all DirectFB .pc files.
>>
>> Signed-off-by: Andr=E9 Draszik <andre.draszik@linaro.org>
>
>
> i reviewed and tested this patch against a QT4e image build. it looks goo=
d
> to me, and that offending patch being removed seems to come from quite
> ancient stuff.
>
> Tested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>
> any chance this can get into 'dylan', too?

Paul, I think it is your business ;-)

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

