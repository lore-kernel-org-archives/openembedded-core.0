Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (unknown [209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4F95F65EA8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 04:56:27 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id lx4so175753iec.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 21:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+PfPOTOZITz0vWPFU+NuxGoSfAny4jAaDopZW5yOXCM=;
	b=U5iz4qm70xklSV6dQSdWzj2WwTRW2XsO2LGK8xcXuzuzrcZrvNtmat1WQu0KPB5Kdn
	IlBD1qb41uC/wBM0JgCXLgwC8K5JUPqPMtvFFOhU303AxSRbIkW1gg2lo9fMSLTDbulL
	cGV8JYhCSBnqeAChLrgtH5r/fL1our4hXTGpgFKQ9XVAfNq8azoqR7RqZswAIZ77kRoB
	Qh1yLKuOLQ4GSQMSInzoQRtAssugVYfWucpEuU5I84faWCCd3TAKZlvRDmPpNF15Hjck
	+a6sTd8Zt6q61aug1VMPAX7C70AnFqg/I4iPMnGwNiL1PaKKNPnx8zolH0cmCP/NFiM7
	E+ew==
X-Received: by 10.42.78.136 with SMTP id n8mr13322797ick.28.1400216188898;
	Thu, 15 May 2014 21:56:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Thu, 15 May 2014 21:55:58 -0700 (PDT)
In-Reply-To: <53757279.3020908@windriver.com>
References: <1400099434-22527-1-git-send-email-otavio@ossystems.com.br>
	<CAMKF1srwzW+pU4K2wgSG6GPmRGmGdGqCbaJi34ZjF0Npi4TOcQ@mail.gmail.com>
	<CAP9ODKrwxJ85rn5sPqaW7cvu3cu0+NFcgHOL_My3oUWR1dok5A@mail.gmail.com>
	<53757279.3020908@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 May 2014 21:55:58 -0700
Message-ID: <CAMKF1sqE6n4JORzXBUYG-4DhTNC2jbLqMJM=bbj1hKyqLFsO=w@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 1/4] tcf-agent: add systemd support
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
X-List-Received-Date: Fri, 16 May 2014 04:56:28 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 15, 2014 at 7:05 PM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 05/15/2014 08:24 PM, Otavio Salvador wrote:
>>
>> On Wed, May 14, 2014 at 7:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Wed, May 14, 2014 at 1:30 PM, Otavio Salvador
>>> <otavio@ossystems.com.br> wrote:
>>>>
>>>> +       install -d ${D}${systemd_unitdir}/system
>>>> +       install -m 0644 ${WORKDIR}/tcf-agent.service
>>>> ${D}${systemd_unitdir}/system
>>>> +       sed -i -e 's,@SBINDIR@,${sbindir},g'
>>>> ${D}${systemd_unitdir}/system/tcf-agent.service
>>>
>>> shouldn't this happened if systemd is enabled in distro
>>
>> Agreed. Added Chen Qi in Cc.
>>
>
> In systemd.bbclass, there's function to remove things under
> ${systemdunitdir} if 'systemd' is not in DISTRO_FEATURES. So I think there's
> no need to add a check here.
>
> Below are the related codes.
>
> python rm_systemd_unitdir (){
>     import shutil
>     if not bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
>         systemd_unitdir = oe.path.join(d.getVar("D", True),
> d.getVar('systemd_unitdir', True))
>         if os.path.exists(systemd_unitdir):
>             shutil.rmtree(systemd_unitdir)
>         systemd_libdir = os.path.dirname(systemd_unitdir)
>         if (os.path.exists(systemd_libdir) and not
> os.listdir(systemd_libdir)):
>             os.rmdir(systemd_libdir)
> }
> do_install[postfuncs] += "rm_systemd_unitdir "

I see. That makes sense.

>
> Best Regards,
> Chen Qi

