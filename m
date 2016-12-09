Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 70028719C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 17:37:12 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 12so2460332uas.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2016 09:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O1Vbtj7rmiGrhDeWl5dT4hH8ccxwiIV1jSBmXIdvt1U=;
	b=sPT24+NB3rNW+lmRXJWz9Q91QjdwkVoz58nRGDb/SjX5j0zoOkHnzn0jxXLzFl/c3B
	QvcgIG2rvwDXYCEnEkmMTscSvwA+NTlqi4M6wlLxeb3xH5TvHWspfTPhTwOGnFjqCx0x
	Q1hXTH2gxMD9SXh3vHPOOjw+OH0+0hosJ4zZJooU+HTaQr9Nleidgsnpe1PhEDvr6k8E
	Uv363PZtGxJ00IuQqXZiXgiWJTJxmnemqkxgzg8NNYNNioaWr7ycfOkreIKBYi1lQdjn
	lsqUA5YLzx5Ruwg2UlX1hU0DILrvGwHP6iF4PfdQork8QZIl8gg5e+eOq+gpXsl6nQ+0
	hEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O1Vbtj7rmiGrhDeWl5dT4hH8ccxwiIV1jSBmXIdvt1U=;
	b=LHrE+70yznte3WhFKsxAF+fRMHLDJnhlVD2P6cFyC/+ohN+bbQEsFTLIcb8VVhasum
	HTalQvPBnArLA8ynW3GpTxb2RK2SzBg30Ehw+Q8KOmJk+Ybgez+/o8Os7ci1SMYO3w7/
	vVOvKxHNwpqJvRJ1RD4/dwwz88fbBw6DXAHF/didOCwUxMIfb9dQrxvgDNWNm4jW/nEB
	bIxWWhiGfsLJbUjxzAOerPg3MZX5bsSAxI509EIETeQwB7MqmZ/xb0YKrl+SUMKlmVsy
	KvE+/Psg1aOJfHE9tg8VO+nUS9uh9yhUgJZbXtJnH3TwZ0dK/oYt1+oMzAD8lpkq9+0T
	CHGw==
X-Gm-Message-State: AKaTC01obpRKE99vHMdQ4lyjzsr2oJ+S0V/V4cfUjuKJYT3pNR8X4gqXgXtJAtEV9pRrM1DJn2LWy4APpg2XlA==
X-Received: by 10.176.84.8 with SMTP id n8mr27795714uaa.29.1481305034005; Fri,
	09 Dec 2016 09:37:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Fri, 9 Dec 2016 09:36:43 -0800 (PST)
In-Reply-To: <a429c8fc-8e0c-971b-9295-4056c09a614a@windriver.com>
References: <20161208190327.221469-1-mark.hatle@windriver.com>
	<CAMKF1sphGgZP8-3DoPi+1Wv3DV6yDOAQW0Z5dNX=QFy16deLXA@mail.gmail.com>
	<a429c8fc-8e0c-971b-9295-4056c09a614a@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2016 09:36:43 -0800
Message-ID: <CAMKF1sp+qaLRGtCSjStZXDqT7Cb6n6nL+9n4_PnF+d_Qu3J4eA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Enable backtrace from abort on ARM
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
X-List-Received-Date: Fri, 09 Dec 2016 17:37:13 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 9, 2016 at 9:26 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 12/9/16 12:48 AM, Khem Raj wrote:
>> On Thu, Dec 8, 2016 at 11:03 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>> +do_configure_append_arm () {
>>> +       echo "CFLAGS-abort.c = -funwind-tables" >> ${B}/configparms
>>> +       echo "CFLAGS-raise.c = -funwind-tables" >> ${B}/configparms
>>> +}
>>
>> perhaps using  -fasynchronous-unwind-tables is better. can you try that out ?
>>
>
> This passed my internal test with the same results.
>
> So either one is fine with me.  What is the difference between the options?

-fasynchronous-unwind-tables  when used with -g emits the static data
in dward2 into .debug_frame
sections so your binaries dont bloat. funwind-tables is for generating
static data that is needed  for exception handing into .eh_frame.

>
> --Mark

