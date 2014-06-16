Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id D7EAC6FED1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 16:36:34 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id o8so8272424qcw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 09:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QS+NlzQjTbfwlSRJaW4oRahPe48pTq/+LxON/uKyZlI=;
	b=B9hw6qIHxfPURx8cpqrCSKQMfmXwJ+jtjMPcs15jgTPzfNqnEuO4B9hOeMIrl+AkAE
	ddqfPELNNT76ooD2Ks1hzUsLrnKP8neKae2cTH5tjU5FnHH98QfMmyUxSblBpEEJmuIc
	5wTHBV516pB7kQnbBarlaqtjVXeqzSQ+GvdOSAp3HbPLiH7xACio3+5WwM2K4zl49sSb
	6B7ZEvjVQSUmDlwFX3wqh4FbSpwpSlYZTq/XJVs4TX63RFw3mOIVQgY8IRpxxn89a5O8
	7zIHxNCnn0ogu8YvJi1sV0maRvAhcGcx5ma+FPgAirJdi+HnSzleddW0TtikvI56MRkm
	Gg+g==
X-Gm-Message-State: ALoCoQkFlEVWz0ak2mWHfcWaFBhinjwx+7xHqNzMwPgztaKjr05x+62N2nxdVz5QBchhZBnYrEuQ
X-Received: by 10.229.53.65 with SMTP id l1mr28112030qcg.19.1402936595281;
	Mon, 16 Jun 2014 09:36:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.91.138 with HTTP; Mon, 16 Jun 2014 09:36:15 -0700 (PDT)
In-Reply-To: <539F08D0.7060602@digi.com>
References: <cover.1396927648.git.Chong.Lu@windriver.com>
	<539EDD51.9060508@digi.com>
	<CAJTo0LbcPqL+E78x1jUX6JH_BBc-uuEV8KDjELap9OJidPtYqA@mail.gmail.com>
	<539F08D0.7060602@digi.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Jun 2014 17:36:15 +0100
Message-ID: <CAJTo0LZXUh1giimTFpdQYBpVJ640wCgr6j6vELaa9h3L+_huyw@mail.gmail.com>
To: Javier Viguera <javier.viguera@digi.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [backport to Daisy] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Mon, 16 Jun 2014 16:36:39 -0000
Content-Type: text/plain; charset=UTF-8

On 16 June 2014 16:10, Javier Viguera <javier.viguera@digi.com> wrote:
> Attached the obvious cherry-pick of the commit from *master* with a basic
> conflict solved. But I don't think this is acceptable in an already-released
> stable branch "Daisy" as it involves a recipe rename (dbus-ptest_1.6.18.bb
> => dbus-test_1.6.18.bb) that probably will break the projects of current
> users of yocto Daisy.

+PACKAGES += "${@base_contains('DISTRO_FEATURES', 'ptest',
'dbus-ptest', '', d)}"

This was changed in master to use PTEST_ENABLED:

PACKAGES += "${@bb.utils.contains('PTEST_ENABLED', '1', 'dbus-ptest', '', d)}"

If you could compare dbus.inc in this patch with master to ensure that
there's nothing else that should be merged that would be great.  Also
remove the Conflicts line from the message.

Ross

