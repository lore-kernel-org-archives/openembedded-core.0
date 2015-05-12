Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5211373F4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 09:12:41 +0000 (UTC)
Received: by laat2 with SMTP id t2so742057laa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 02:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=WrV62Apl8oufZ9b4VKzCQ+er87UV4XsubpBuoxXbXJM=;
	b=JJ2B3roq3vYJFmN45R74rQkgeLMllMVBI8GN+WlJ01yeOhlwIJFCtOW0wdT/R5Wcrm
	WTzURWNkS/NG/ag8rgHVqZHKbssavEOT3r6lUqG1dQdNaQEINCNPnj40YIxt1Cjx+nrm
	Kjddh3fy1bbgKE8EUZhDSeFdLQkeTJBjfGzZYAIqDGrYEKruiWIWGChjuvwBHrhQN7En
	yJHoCs8w+nA2AqcPb3AYuNu5elzLcEH2dztXL2HkucEhKN3onpBuFHjOP21tRRzHWpnq
	8MD2iEMPbdr5ocOYLIEQfEP4x03L6qZ1pVI9gAC3Vl2W3SP8I+qFy78o+4msB8yW4+cq
	1m8Q==
X-Gm-Message-State: ALoCoQlvainN/doEu1Sio3br40i9QCSTky9sZWzzLUwx5wHhOwVvOsb1JakQlrHyJyWs4iwiWmd+
X-Received: by 10.112.17.68 with SMTP id m4mr11430369lbd.10.1431421961928;
	Tue, 12 May 2015 02:12:41 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id do6sm3651153lac.19.2015.05.12.02.12.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 02:12:41 -0700 (PDT)
Date: Tue, 12 May 2015 11:12:38 +0200
From: Anders Darander <anders@chargestorm.se>
To: Bruno Bottazzini <bruno.bottazzini@intel.com>
Message-ID: <20150512091238.GA8861@ad.chargestorm.se>
Mail-Followup-To: Bruno Bottazzini <bruno.bottazzini@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1431367371-7716-1-git-send-email-bruno.bottazzini@intel.com>
	<1431367371-7716-4-git-send-email-bruno.bottazzini@intel.com>
MIME-Version: 1.0
In-Reply-To: <1431367371-7716-4-git-send-email-bruno.bottazzini@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V4 3/3] systemd: split modules into packages
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
X-List-Received-Date: Tue, 12 May 2015 09:12:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Bruno Bottazzini <bruno.bottazzini@intel.com> [150511 20:03]:

> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index 6ed4fe0..e83601f 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -19,7 +19,18 @@ PROVIDES = "udev"

>  PE = "1"

> -DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
> +DEPENDS = "intltool-native \
> +           gperf-native \
> +           readline \
> +           libcgroup \
> +           libcap \
> +           qemu-native \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)} \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'kmod', 'kmod', '', d)} \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'docbook-sgml-dtd-4.1-native', '', d)} \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'acl', 'acl', '', d)} \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'glib', 'glib-2.0', '', d)} \
> +           ${@bb.utils.contains('PACKAGECONFIG', 'blkid', 'util-linux', '', d)}"

These lines should be removed. The 3rd parameter in the PACKAGECONFIG[]
definitions below, do automatically get added to DEPENDS if the
respective PACKAGECONFIG is enabled. Thus, you don't need to check for
it yourself in DEPENDS.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

