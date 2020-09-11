Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web12.6188.1599824876980467605
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 04:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=iS8ZYUgo;
 spf=pass (domain: burtonini.com, ip: 209.85.167.67, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f67.google.com with SMTP id y2so5502477lfy.10
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 04:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wnSnaY0np92SrYNkD3Shyw1lAIFPe64e7Ex+HDD966Y=;
        b=iS8ZYUgoRHifdhOSBMCyHU2Z2nF9PjEgHQImUks3Pp0SKkS543IFFDJdL+E7Vl2Uwz
         HwshkIBnqsLYtlHQGtEP956chMuiImCLM/33zy6a66lShLgvYsGdfzMNsdbAW9ITpJRf
         2ZFtPc2aSP0fA7XxW86a+/S2DlhywIu1Idj4wvTASnEbWCm5/V8kwygXXJ8Slt74doPZ
         3YSvdIYn20DJGB8XGF+5FLq6KKf6PhsTffkJtnbItkTlnKZslyOQinpC59SLpX/ZvbRW
         IAAgmAFwe3adiM6SJwzO2HjV1CDidaZk+23W7OFrujm2QAgy60oMjAzsF3YQVNcXRR0C
         H5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wnSnaY0np92SrYNkD3Shyw1lAIFPe64e7Ex+HDD966Y=;
        b=En/YlxyidLPJlHcqvzrEt37dAd0AFiJ7dXs3cF2wjeH5aQFoWGWQ/kuIbEs4ff2Tn4
         YOPWh/uvxWdO6znivshyMmTvGAojNEz6zofa8rfJDEQ/TFBd2XvUD62LMJ6VXuu1bKdZ
         w1Wv95aWauFfPNzenuM5CN1W7jSdTFWamzaxGqILRoZ1Bypdhfqp5DxIWHZ3X963x0FC
         0Q8DuWK4sY/1MAYIimyHCTRXTT9lWs6zID19wa/QEUk0SGXcuBtJZIzzSpzP0iGBxq3O
         e9zFwEWj3T1tMSsSpiKyqAYde/h5UAtg3Pr79bfV3JOaaWUL2UvrOG86YjxRgdewIIEN
         hy6Q==
X-Gm-Message-State: AOAM533F5+mIwmPt3gQnkiAUFTv+yS4jy1lkCmKxYGXuiWz1ZW2vDLNy
	rPMPG5VMAG6ixLSrRfzUe0dq9PJYhfSdmhG5gS5jMw==
X-Google-Smtp-Source: ABdhPJw6wZ/iH/jqgXUU4IHz6JXlpqhgEbzfHl2usP5WHFvUZujy3yxb+Web9awh7G0g9AbwyiXfnMzx2lPmO54yhu8=
X-Received: by 2002:a19:4c87:: with SMTP id z129mr630081lfa.189.1599824874853;
 Fri, 11 Sep 2020 04:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <1599821817-27585-1-git-send-email-pemorrow@linux.microsoft.com>
In-Reply-To: <1599821817-27585-1-git-send-email-pemorrow@linux.microsoft.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 11 Sep 2020 12:47:44 +0100
Message-ID: <CAAnfSTu-0GDByMD3-H1OewWzMGisha8nJ4dGGZTYcR-J2y0jXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] squashfs-tools: Allow COMP_DEFAULT to be changed easily at build time
To: Peter Morrow <pemorrow@linux.microsoft.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

> +python () {
> +    # Change the default compression algorithm if requested.
> +    comp_default = d.getVar('SQUASHFS_TOOLS_COMP_DEFAULT')
> +    if comp_default != None:
> +        d.appendVar('EXTRA_OEMAKE', ' COMP_DEFAULT=%s' % comp_default)
> +}
> +

This is overcomplicated.  Just do:

SQUASHFS_TOOLS_COMP_DEFAULT ?= "gzip"
EXTRA_OEMAKE += "COMP_DEFAULT=${SQUASHFS_TOOLS_COMP_DEFAULT}"

This way the default is documented in the recipe, and we can change
the default easily too.

Ross
