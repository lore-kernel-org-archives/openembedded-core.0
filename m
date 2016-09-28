Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 98F6D605C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 11:56:30 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id w84so5581048wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 04:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dIYnPthPlezhi2OBkX0IuEgMUgSdic6ggbq+PtMFxro=;
	b=iA36rzy2UR0IEw7R4ZBUGeYIcoKW6S70/lg80v/FGOp5P4oDr3RNcoiHNPpkteOMUu
	YeLCsjwIsKsHmjwLnqDyQ9z4kHFqXzIWfVb6DPQG+ovFB9uRwFAFjjLDwvCvFMVeSTTp
	+HKRNXgOKlZM85YPXSMvrdTYlsXE8hTGzMj7vsPiOoIY85OrRMQMcas/x0nCYjkF2Vzh
	O6+SJJXa7XfnK6hnXhjzmRIOzbeX0NmGqE5p8z0dnd7wox79SYHp9fZ4IGBZUXUt/met
	Io1pkwcRqIxp6oYKl9GfmloSciTR8UJ2mrhfhsRt9YakYONWFAPsL/2gu/dfZv7Fc5pT
	tZJg==
X-Gm-Message-State: AA6/9Rk6A+R36R8Wao7H512X00tlvowN9NMj1nFTVZ/SBVVTXx7HhOxpLviVa0LnsTBBpA==
X-Received: by 10.28.130.137 with SMTP id e131mr7456141wmd.14.1475063791288;
	Wed, 28 Sep 2016 04:56:31 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	qa7sm7838306wjc.39.2016.09.28.04.56.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Sep 2016 04:56:30 -0700 (PDT)
Message-ID: <1475063789.5024.13.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Sep 2016 12:56:29 +0100
In-Reply-To: <CAJTo0Lb9AmtOVA73xVkqmXJzQfvQQc0wBspv+miNo_eyuBUCmg@mail.gmail.com>
References: <20160926154228.30567-1-git@andred.net>
	<20160926154228.30567-3-git@andred.net>
	<CAJTo0Lb9AmtOVA73xVkqmXJzQfvQQc0wBspv+miNo_eyuBUCmg@mail.gmail.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cve-check-tool: report progress when downloading CVE database
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
X-List-Received-Date: Wed, 28 Sep 2016 11:56:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Ups, sorry for that... :-(

Should I send a patch against master-next, or against master?

a.

On Mi, 2016-09-28 at 11:54 +0100, Burton, Ross wrote:
> On 26 September 2016 at 16:42, André Draszik <git@andred.net> wrote:
> 
> > 
> > ++static int progress_callback_new(void *ptr, curl_off_t dltotal,
> > curl_off_t dlnow, curl_off_t ultotal, curl_off_t ulnow)
> > ++{
> > ++        (void) ultotal;
> > ++        (void) ulnow;
> > ++
> > ++        struct percent_t *percent = (struct percent_t *) ptr;
> > ++
> > ++        if (dltotal && percent) {
> > ++                long diff = percent->end - percent->start;
> > ++                if (diff) {
> > ++                        fprintf(stderr,"completed: %lu%%\r",
> > percent->start + (diff * dlnow / dltotal));
> > ++                }
> > ++        }
> > ++
> > ++        return 0;
> > ++}
> > 
> 
> This fails on the autobuilder cluster:
> 
> > 
> > ../../cve-check-tool-5.6.4/src/library/fetch.c: In function
> 'progress_callback_new':
> > 
> > ../../cve-check-tool-5.6.4/src/library/fetch.c:55:54: error: format
> > '%lu'
> expects argument of type 'long unsigned int', but argument 3 has type
> 'curl_off_t {aka long long int}' [-Werror=format=]
> > 
> >                          fprintf(stderr,"completed: %lu%%\r",
> percent->start + (diff * dlnow / dltotal));
> > 
> >                                                       ^
> 
> Ross

