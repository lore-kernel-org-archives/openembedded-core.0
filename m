Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5456471AFC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 11:53:36 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id o81so4539578wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 04:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mpDppwwYfXyYhunzeBhb/dPPYldcEzNih45JXPdxD6w=;
	b=jTgHDsiK7MwHPbWGnpSr0Hg+ChnBVaEfGdFplsW0aA/0P0PhR3dV+GkNun8VOseSnY
	GVd7ERahcAa5UHOR6gZKUdbfCAvpqbcpV0Z/V3flKdNcgQ/3Zgj0/qHdfKr3q1nUW825
	iBeDG8GfOtEDmmC0RZk1WTbcLwHOnxSK8m4Zq+Nn9WEQbnF16qEWrPt2tv6cdHMW/u2H
	aogc76EoBXYDsf9Fy25++tjd5oOPFuOc7ekPMv4C6/j45l9PAuxkC1H40K9Khpxo0NYM
	6ejpT/3v1102dw85wd93YZbx2mCk7DJWOqOEgVnrR44wcAMrSR8Q+HrW0H4pAcf1UMbw
	LWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mpDppwwYfXyYhunzeBhb/dPPYldcEzNih45JXPdxD6w=;
	b=cdpHXFmOChlVhmjoj7bWR5vixkkpSpfZz0A/1wcTxMvLB60Ax+p0jOb5j7DWNE8kly
	k/yWLFEWRt+DY/3ppVdzr/vIQJWwfZbvR5SLMNEw+4nYp7BL0rTOfH46NJoxj/xNbRhc
	GKBvsDYOHc9hRQHdT+rbgdbc9GULu1qKhT4UKeJah7XF0iyzjK8/rQ2bWSErj6i6VXG4
	NapBEDrfv3apI44CmrFeG9usN8KyYUjFOvYpONpF0mLYgOsAX2KfwTGvrFQeQusUQ7yH
	1DBICDjp079EDT42caj6uRl0mtIg0hkh4quygSPJGGbwiRbfYIjmIHkXParPnyRFhKAa
	LdxQ==
X-Gm-Message-State: AN3rC/6KeEXG5iH9+vR0V+YtCT70sucCdxp+SbvuII4SxHir1jktHQkH
	80y3vcJWPxk4jA==
X-Received: by 10.28.8.83 with SMTP id 80mr16995650wmi.23.1492602818068;
	Wed, 19 Apr 2017 04:53:38 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id a5sm3445830wma.28.2017.04.19.04.53.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Apr 2017 04:53:37 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 13:53:29 +0200
Message-ID: <6366113.GnGklEYiun@crde-port-20.cahors.local>
In-Reply-To: <41b8c861-c67c-7ed8-b13d-a54f8c5c232f@linux.intel.com>
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<2335903.2zueHJxyF0@crde-port-20.cahors.local>
	<41b8c861-c67c-7ed8-b13d-a54f8c5c232f@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Wed, 19 Apr 2017 11:53:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On mercredi 19 avril 2017 12:21:18 CEST Alexander Kanavin wrote:
> On 04/19/2017 11:27 AM, David Vincent wrote:
> > The package is then chosen during image creation based on some
> > MACHINE_FEATURES, i.e. if the machine provides a crypto accelerator to use
> > instead of relying on software implementations. I hope that these new
> > details will help you understand what I was trying to achieve.
> 
> This kind of thing is better done via ROOTFS_POSTPROCESS_COMMAND, I
> think. Look for examples in rootfs-postcommands.bbclass.

The problem of ROOTFS_POSTPROCESS_COMMAND is that it is a one shot function 
that is run at image creation. In my case, I must be able to upgrade the 
package over time via package management tools. Sorry for not bringing that up 
before.

> 
> Alex

David



