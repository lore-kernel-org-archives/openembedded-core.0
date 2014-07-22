Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id B303B705FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 15:32:24 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id k15so6631060qaq.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 08:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wWRjeRMfdIsqeehrfW1z9KYkW0kGE2IQ2tIQa6F91/Y=;
	b=K38Wr09ozYeYqtjOWMLHraU5pqxacb0l5qxybfgCeURax87aPyWXxs2Z4d+Bo59Etf
	ifYgDAJt52goZ56jHev+So9ihcdP5mFkLTyeiM0I9vn81vLGcWuLkhFdgc2ynjOcOtV8
	VzgYOm+X/wW/NM0ACbykkKpxyZBG26FSrjg5oyi8QADZYn/uMFpOJzdMI0BknvibpePe
	NHfCxCo1s5HU+FFGtxIgBkOWNEykkTgOyUD7Y6ddkwRUXgves21MJ0Ds63s6PlE8geoc
	hLs5XfmEwnljAd/8gXg6VrDDXjigQx0Lx6f8ZBnwJzBlpZcc1tdGoZiK2Uup7YHSRWNJ
	UQjA==
X-Gm-Message-State: ALoCoQnku5mUcqbPaAG0INlQcDwUW+YdNmRNXkZLnZNhW+lYXb9Q3W2Xg1SaP5TesnA/+rKsEj+l
X-Received: by 10.140.19.100 with SMTP id 91mr39500339qgg.32.1406043146237;
	Tue, 22 Jul 2014 08:32:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Tue, 22 Jul 2014 08:32:06 -0700 (PDT)
In-Reply-To: <eb52483d72008b797160d1423aa289b1e111dac8.1406037471.git.roxana.ciobanu@intel.com>
References: <cover.1406037471.git.roxana.ciobanu@intel.com>
	<eb52483d72008b797160d1423aa289b1e111dac8.1406037471.git.roxana.ciobanu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Jul 2014 16:32:06 +0100
Message-ID: <CAJTo0LbVemTY0dhc-4SBh1h0+SpzNmhwYT5jhykJp82jh8sZnw@mail.gmail.com>
To: Roxana Ciobanu <roxana.ciobanu@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bitbake.conf: move BB_NUMBER_THREADS and PARALLEL_MAKE to bitbake.conf
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
X-List-Received-Date: Tue, 22 Jul 2014 15:32:29 -0000
Content-Type: text/plain; charset=UTF-8

On 22 July 2014 14:58, Roxana Ciobanu <roxana.ciobanu@intel.com> wrote:
> +BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"

Thinking about this some more we probably need the assignments in
bitbake.conf to be ??=, or to be moved further down the file to after
local.conf has been evaluated (there's a section marked Weak
Assignments, for exactly this situation).

The reasoning being that existing local.conf files will likely have
e.g. BB_NUMBER_THREADS ?= 8 and the expectation is that this
assignment will work.  If bitbake.conf before local.conf has been
loaded uses ?= then it will assign as the value hasn't been set, so
then when local.conf is parsed the value has already been assigned and
that assignment won't have an effect.

For consistency with the other variables that have moved to
bitbake.conf, I think we should move it to the weak variables section
in bitbake.conf and keep using ?=.

Ross

