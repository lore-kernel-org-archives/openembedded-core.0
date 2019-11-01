Return-Path: <andrei@gherzan.ro>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id ABA497F693
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 11:28:44 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id j85so6113697vsd.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2019 04:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0pkeQE6pHfLogX/opmZk32hfLZM9HGGr836JeezRcEU=;
	b=g46R2iWyAcj/fm6b0yiB3GzlnFcVYWb9fMWAWcFwWPDBGWgv3p/KQdZluP9PvUNQhE
	COSW7LTrGXQFg+jltLh9FmbzgDNlGkr5r1JWS4fJJLmFnDP0tmm6m+PqQmgQAUU9dAxJ
	uBI3ol39o8dBYNf/lx0TNqPIZDq0zykvTGQ1AnKSiGc9aE+No8R+jgmgYHh2FWwHFLTR
	HWtukLvKVM41A13I/J3rON4ElLaH4zwxZr7dzlb6Nx0N3NZeWoHUEXbBio6S4GK6JAFP
	7h4yOsOEVjxxJI26WEBXEQGdwdH5GalbIYL6eoWXno3LZg0sdVMyEGohZaKDmXBuo4vu
	Z/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0pkeQE6pHfLogX/opmZk32hfLZM9HGGr836JeezRcEU=;
	b=sz+EdiRmfEThOXzKbKvgEBDlVKIm/RQe/9bFNIYNBKG+Rrxp4jXwLK+F4lScYRq61Y
	TYBookxvbCFl7DzIZCwug/5Big1COechcP0/rFjtErnFFjUWRQqsFAXcMRB39kG9i9dX
	taaWGNBMp8qdQRg3B5lNZ6pOiQSPIa8lPhAoaDX6UWZWmMwSOi6Ucm5YEwRN24Z5kDd1
	vPmgdE4S3EpknNeI+53bgmdj8Az4MAxt/dh2leC7b6BddrhVcQYkrzT+1nkTYMXbpIKz
	hhvo2F1aJiDruv4TnkCWt5SffnLeT6bW53JyxsEIZhdZnEZHRiPQ4UAC1zAqxGS6YrTU
	byHA==
X-Gm-Message-State: APjAAAVpCc+Q0iX2+e1ICb/NJx/EXFVL/ubY4ZOFZ1onyP3xG7acipBS
	0DBt+plh35306QFIHw0t7AJGjfXNp4h7wlVIvKbfww==
X-Google-Smtp-Source: APXvYqz+P8H77OPd+bzA7hJuk88K94ANzQJk9U4o26BUd6gcH0D+GguRwxFjHZm/bTIk8e9iRDuOQMhomN+71db+oXQ=
X-Received: by 2002:a67:ba16:: with SMTP id l22mr3209319vsn.147.1572607725464; 
	Fri, 01 Nov 2019 04:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191101071043.16558-1-gtertych@cisco.com>
In-Reply-To: <20191101071043.16558-1-gtertych@cisco.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 1 Nov 2019 11:28:08 +0000
Message-ID: <CAK18fxFVpCbD38Y3FK2XMfvK_+pZF2-usf1xC5P2oR5FQhQC-Q@mail.gmail.com>
To: grygorii tertychnyi <gtertych@cisco.com>,
	openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: Re: [PATCH] archiver: avoid empty incfile in ar_recipe
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
X-List-Received-Date: Fri, 01 Nov 2019 11:28:44 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

On 01/11/2019 07:10, grygorii tertychnyi via Openembedded-core wrote:
> do_ar_recipe fails on perf recipe on line:
>
> include ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perf-perl.inc', '', d)}
>
> 1. "${...}" part expands into empty string
> 2. bb.utils.which() takes empty string and returns first directory name from bbpath

This doesn't sound sane. If the include directive has no argument,
incfile should end up None. That's what the code "assumes" at this
point. I would fix it either at the regex expression level or
stripping the matched string. I reckon the former makes more sense
(.*).

--
Andrei Gherzan

