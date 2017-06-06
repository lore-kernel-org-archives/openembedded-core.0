Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 83D8971AD6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 17:34:26 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x3so8713849wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 10:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t0R+gq/7R7qcwrBPWE/aqalAtPdSzj155/7eQM+KRdk=;
	b=o/QrvIgkRu+Q/yBHIwY039h1B+wzKLupajNIolAI6rQChvLImVxmWSutyE/jPClTDY
	BPTQk/HpRsqYQJ8Mexy5MLs7qdfEAC4iEh+l1mCyhG/dovhPg28TGXRxy4fGymY0TWbk
	X2fCFHMxGpM5DnXrSPZr5Fsf41LuEer056aKhzNEkbaI/DfFgNvZTGLEcP+MJvbSVtVf
	cRgi/I8yPJi3d0bkztP7AF9c0c25qcwu6kjHamE35stYgflnMAMH6JaqzdkC7UP5AjRF
	QePVptnK3QxBCzdZ0y9h+Mko7c8MwTjqMQqmrdXlGt6dTp6GxIzJkwNPbkAVRoZL91WO
	G56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t0R+gq/7R7qcwrBPWE/aqalAtPdSzj155/7eQM+KRdk=;
	b=d04rhWbsLpII55TT6QzZxM4mD/VtDLikYXRDP4KIfANRFRysvqLlF/vDGjE6kp9ETG
	7r1GN/Iw0UwYRiBxEiIrsE3nT/XGZQ0x3LG/NHEG150vJarMPLyG+iIDHMnnpwW9Kea6
	nkk6zTehfbEB+yYsN+mhyIccGruxTkED51ZzzZdv8URUmMc7pOC8V4x+6pAODnTx6gG8
	xZYPZC9KeHdF/bZrnpUpy15iVzI6Q2NzjyckvyhwWxE6AZRiwizOyKr608qmqQHOwExE
	uzJPPhFtsUmQY1vNt2qVrReOecyar/t0l8R/Potw08r3vKwWQI3Uv1cyK6B9zrW/VhGh
	jqLg==
X-Gm-Message-State: AODbwcApAqUZc7NZWlC68i06KGLUWxsvI3mCOGjqTClEnH/akUT4ECW0
	6PYIFNIKjLV6Ag9dFPYDhTSz/KOqSA==
X-Received: by 10.80.147.195 with SMTP id o61mr21122635eda.178.1496770467339; 
	Tue, 06 Jun 2017 10:34:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Tue, 6 Jun 2017 10:33:56 -0700 (PDT)
In-Reply-To: <CAJTo0Lad6-=shjk=C9_AJVyYsGP3dJ1dDUXcRH6j=coywGMqMQ@mail.gmail.com>
References: <20170606171346.21413-1-raj.khem@gmail.com>
	<CAJTo0Lad6-=shjk=C9_AJVyYsGP3dJ1dDUXcRH6j=coywGMqMQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Jun 2017 10:33:56 -0700
Message-ID: <CAMKF1sqWoPwONt_t+Qczw_Sm=CAefOnN82tkneYYZGJ=BekW6g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Add define to indicate missing 64bit atomics on armv5
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
X-List-Received-Date: Tue, 06 Jun 2017 17:34:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 6, 2017 at 10:32 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 6 June 2017 at 18:13, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> This is wrongly detected by configure since it only checks for
>> __sync_add_and_fetch and not __atomic_fetch_add, it decides
>> to let compiler emit references to atomic functions which
>> it expects to be provided by libgcc, but thats not the
>> case for armv5 arch
>
>
> Is the true fix to adjust configure to look for the right operations?
>

yes. and there is such a patch proposed as well to mesa but
it has got some feedback so I did not bring that in. This patch
instead is surgical.

> Ross

