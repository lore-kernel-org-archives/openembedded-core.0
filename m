Return-Path: <net147@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0EEFC77F34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 10:24:30 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id h64so14954649iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 03:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dGHLCtrU/DHvTuwx3iV82ZrTZlhzvy2x+RIFuWGBRI0=;
	b=gIOOE+fsbcL3LNfIeVxihoC1QDk4v9VIsfw4W01dGDBNf9YGPjeBoN9TD0QzO0k0kI
	oIv7XEkhuekz1KOjt/+oc52CugHiD+WqApJ/IsgEm4TLQYQlt2XU6Izo8XX0NqUF615O
	ToV5Xm/mnWDvW4w8n/RMzEXvLm5lFrc9GQ09S3D2Gi5BW3kdzPpbM5JtTb42uuzq2iTW
	4rEN4dcQx7PY35erHs2XuDYvDtDjldeONC3o48qFoQuWghUU1Lmup3ZKuLaSbfmoPYkF
	cDEdhHvymiUXzr5/Ijef9LOeNCfi1ZdRLvH/RtiLlCTERU5VqApKSHw3A+hrtmcuCmmz
	VKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dGHLCtrU/DHvTuwx3iV82ZrTZlhzvy2x+RIFuWGBRI0=;
	b=pmoB2a8rw952QQa5mhjngmWZuU8wp2vLixY6Y4X7bNYid2pIdOy+lfVjiMZ+/dY22o
	5p0JvGylcMN/NmhrJIFN1DzL78YKIFxTUKy5DI1AXEbsaSC8clhEJA3RujCeyyCMPxQa
	c8W460EGNiBLLbq9sFKydmsSPHN4Mk0MBDiWNPJ+lJ159/lSKcrtMsRCSxfVQqXeRhzL
	NpG10r5Ezn9suSdRZz2l/yj3PbmZdeLsRpVxJOoURvFgqTlLhehHA/RpaeCfahuSR+hg
	0KnGJNqqIezAbZrxRSzaUzio6P83EjtcbImbGaPPTFpcbmlBSLBxk6EH5hhuU/EV3yad
	1xkg==
X-Gm-Message-State: AKS2vOzHSeaX5rwsPklUJSzOJxubO0DL2SRn9z00sBuo5QWAzqR6XD7V
	wEsGqWUdVtzVwndre/3cfZJKOQA41MyUua4=
X-Received: by 10.107.40.18 with SMTP id o18mr5595668ioo.128.1498559072213;
	Tue, 27 Jun 2017 03:24:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.104 with HTTP; Tue, 27 Jun 2017 03:24:31 -0700 (PDT)
In-Reply-To: <1498558903.7464.37.camel@intel.com>
References: <20170601121552.27868-1-net147@gmail.com>
	<1498554326.7464.33.camel@intel.com>
	<1498558903.7464.37.camel@intel.com>
From: Jonathan Liu <net147@gmail.com>
Date: Tue, 27 Jun 2017 20:24:31 +1000
Message-ID: <CANwerB3jfo=r=xcHdn8+yU1=r9JmK0_3MCnQWdf8uDh=Tn1AGA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Tue, 27 Jun 2017 10:24:31 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Patrick,

The original problem was that bitbake would print out the error:
"libsdl-native is set to be ASSUME_PROVIDED but sdl-config can't be
found in PATH. Please either install it, or configure qemu not to
require sdl.", if "libsdl-native" was in ASSUME_PROVIDED even if the
host has sdl-config in its PATH.

This occurred really early for a clean build and bitbake would bail
out. The sanity check is in meta/classes/sanity.bbclass.

Regards,
Jonathan

On 27 June 2017 at 20:21, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Tue, 2017-06-27 at 11:05 +0200, Patrick Ohly wrote:
>> Even if you had checked the right variable, is that really necessary?
>> I'm building qemu with ASSUME_PROVIDED += "libsdl-native" just fine on
>> Debian Jessie, without sdl-config in HOSTTOOLS.
>
> I'm still interested in learning what problem it fixes.
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>

