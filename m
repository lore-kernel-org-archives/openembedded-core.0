Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4056067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 23:29:12 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id 82so1932160qko.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 16:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ddw3zi4gI3799jqWZNhscI8wZ3mJGwzJfbuZrz7X4dQ=;
	b=G3aWJOaq4jSEzaIAS46oF/e2wjRyhoTysTwWLLk0WsQ5SANwGdTyrsOl2YgNVAEi8J
	lUIRNTbWmi6B3Dt/lM/21AMchHmuFmGYGUPK71O1NdktVACcXFhZmZ2WVa+VAjVKg9YK
	m6MPTI9Zn/Uw/nLgilhU8UCVS3y6BFSiOAwpmb7KAi0evp4aYQ7bXNtZ9Hy4AD6bXc1S
	WTxFStLvf6y4EU52pdxBGE9p5OyEK/peFDPyVZFBnYyV8t4Hxb6ZjI7+Dv8YwR0+a6y6
	n8baO3cj1YBwAR0SrvXagRs7d9/YqGu1v4b27a1ubKWzaMyO3ohpNyQ/fhVphq2s1w/1
	U7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ddw3zi4gI3799jqWZNhscI8wZ3mJGwzJfbuZrz7X4dQ=;
	b=VnOKRgKYUZkE1yccNS95JxtAgL6k1v3/HFMJFdvYMDeCo6TTREXrnIEDa6Wzmo1QV9
	1fs3JkkUA7Dxe1x8sM+6wDf20H5e3pM2jZsRVjcc7pzDwKLIk+5uApNrY5PDROLLpFym
	x3N//9zojHYriAm7ksRc4wTjqS4DFpLsDHZdqxj4lrrITAZf8TTiRxz2DaJ1hD3HJxuz
	/JLK3QD7G9tef1YWM7CqlSAL/cBpXaaxngqaiKU9EHpnlsvl8J+79ovrhIrl2i2KqfKT
	A3vuobYNBhfTi/x/Pvw+fKor76ZPjxoZsF6qrf6Tf8zDnSdW6lQ4V1VAlM5VCt8PhbOo
	V5jQ==
X-Gm-Message-State: ALyK8tJ0un1u+ORHA5NQhX9mQGA3qZ0mPlrtA7vsqWqcviG9i6+KF1oCYDKxCP+4nMFjz0Lo6GLJE/ZUvcnIVw==
X-Received: by 10.55.39.142 with SMTP id n136mr6764787qkn.149.1468366152754;
	Tue, 12 Jul 2016 16:29:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Tue, 12 Jul 2016 16:28:43 -0700 (PDT)
In-Reply-To: <1468316570-26620-1-git-send-email-ross.burton@intel.com>
References: <1468316570-26620-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jul 2016 16:28:43 -0700
Message-ID: <CAMKF1soguLQKZ-Tkya=GrGoY4bPEEbgYChZXOCCCtu0MP7dvnQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] report-error: replace build paths with markers not whitespace
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
X-List-Received-Date: Tue, 12 Jul 2016 23:29:12 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 12, 2016 at 2:42 AM, Ross Burton <ross.burton@intel.com> wrote:
> To remove potentially personal information and reduce irrelevant noise when
> searching for similar reports the error reporting class removes ${TOPDIR} from
> the logs.  Whilst this is valid intention, the replacement of ' ' results in
> potentially confusing logs as it appears that builds are happening in /tmp, or
> whitespace can appear in places where it isn't allowed which can look like a
> bug.
>
> Solve both of these by replacing the value of TOPDIR with the literal string
> TOPDIR.
>
> Also replace TMPDIR after TOPDIR, as it's not uncommon to have TMPDIR somewhere
> other than directly under TOPDIR.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Tested-By: Khem Raj <raj.khem@gmail.com>

> ---
>  meta/classes/report-error.bbclass | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
> index 5cbf8f0..c8c15bd 100644
> --- a/meta/classes/report-error.bbclass
> +++ b/meta/classes/report-error.bbclass
> @@ -59,9 +59,11 @@ python errorreport_handler () {
>                      logFile = codecs.open(log, 'r', 'utf-8')
>                      logdata = logFile.read()
>
> -                    topdir = e.data.getVar('TOPDIR', True)
> -                    if topdir:
> -                        logdata = logdata.replace(topdir, ' ')
> +                    # Replace host-specific paths so the logs are cleaner
> +                    for d in ("TOPDIR", "TMPDIR"):
> +                        s = e.data.getVar(d, True)
> +                        if s:
> +                            logdata = logdata.replace(s, d)
>
>                      logFile.close()
>                  except:
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

