Received: from mail-ob0-f178.google.com ([209.85.214.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UJWw8-0004lo-1c
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 23:29:17 +0100
Received: by mail-ob0-f178.google.com with SMTP id wd20so5016230obb.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2013 15:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=pLkyop5R1EOuvgSDyNCV9PXMdoZC7x5xpVXJPAqi5kg=;
	b=DtaUEsclWC3L4+gqUMUs3//X14ZivGgq8BziZq2FR6z7dyZsO9be44OTe5m5ZUynqw
	B9txSnfF429VHU8enReZv1MbUKg0gjN7oDz+wWc/Q6sTwMC+mRHsz8ULuejXTML921+j
	rF7nvkAEa4RgcX1ljVOE84dTNYkHp5nlUlJ1SL3hw5dBjDu0QzDrPj3QoEBjFL8sH5wx
	vMIY04Id+hQZFw2XxJTYtnN6+BfvtkyuUeJBqW/AYPbtxdE0fDc618nH+CQdT6d6/k6b
	vnkIR+D2wFP07Elgb/AyjzEWPF1ns2Yega/Y61syTP1xXGPN5HsgcmDxtV7uFULll2yG
	ltsA==
MIME-Version: 1.0
X-Received: by 10.60.171.102 with SMTP id at6mr6454199oec.60.1364076739569;
	Sat, 23 Mar 2013 15:12:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 23 Mar 2013 15:12:19 -0700 (PDT)
In-Reply-To: <CAMKF1spK6DrofoT3wXMbF=JOU+qWRJvE7vukNsdaFjEnS0XDnA@mail.gmail.com>
References: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
	<CAMKF1spK6DrofoT3wXMbF=JOU+qWRJvE7vukNsdaFjEnS0XDnA@mail.gmail.com>
Date: Sat, 23 Mar 2013 19:12:19 -0300
X-Google-Sender-Auth: SDzArGxJiw0O38bAcdkYVGHCrs8
Message-ID: <CAP9ODKrAFM64tD+-5Nmtr8NLh7=snzokPHvBHH=cJVj9Tqr4oA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] linux-firmware: Use the included Makefile for install
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
X-List-Received-Date: Sat, 23 Mar 2013 22:29:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Mar 23, 2013 at 6:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On Saturday, March 23, 2013, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>> This uses the install procedure included in the Makefile which avoids
>> code dupplication.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  .../linux-firmware/linux-firmware/makefile-fix.patch  | 19
>> +++++++++++++++++++
>>  .../linux-firmware/linux-firmware_git.bb              |  6 +++---
>>  2 files changed, 22 insertions(+), 3 deletions(-)
>>  create mode 100644
>> meta/recipes-kernel/linux-firmware/linux-firmware/makefile-fix.patch
>>
>> diff --git
>> a/meta/recipes-kernel/linux-firmware/linux-firmware/makefile-fix.patch
>> b/meta/recipes-kernel/linux-firmware/linux-firmware/makefile-fix.patch
>> new file mode 100644
>> index 0000000..8a23284
>> --- /dev/null
>> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware/makefile-fix.patch
>> @@ -0,0 +1,19 @@
>> +build: Avoid use of bashism and Makefile deployment
>> +
>> +Upstream-Status: Submitted
>> +
>> +Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> +
>> +diff --git a/Makefile b/Makefile
>> +index 321a4e2..9bdeef0 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -9,4 +9,7 @@ install:
>> +       mkdir -p $(DESTDIR)$(FIRMWAREDIR)
>> +       cp -r * $(DESTDIR)$(FIRMWAREDIR)
>> +       rm -f $(DESTDIR)/usbdux/*dux $(DESTDIR)/*/*.asm
>> +-      rm $(DESTDIR)$(FIRMWAREDIR)/{WHENCE,LICENSE.*,LICENCE.*}
>> ++      rm $(DESTDIR)$(FIRMWAREDIR)/Makefile
>> ++      rm $(DESTDIR)$(FIRMWAREDIR)/WHENCE
>> ++      rm $(DESTDIR)$(FIRMWAREDIR)/LICENSE.*
>> ++      rm $(DESTDIR)$(FIRMWAREDIR)/LICENCE.*
>
> Can you explain this change ?

From the patch file; I sent it to upstream already

+build: Avoid use of bashism and Makefile deployment


--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


