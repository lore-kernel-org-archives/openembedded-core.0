Return-Path: <paul.betafive@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id C71A56A9D4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 19:18:39 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id o8so3507089qcw.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 12:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=4iA1WvrLTTqNIpqCzCBAbvTVk2Uth/7H9Y+d0xf9JUs=;
	b=HyKuP/zYfYpQJ8PRLb5bbrmZz2/mcKDRemy0nLnuRv1vHijcBKQkMf+2b0muTzbRh7
	EWrD9LVxNqR34EY7y1IysY8cOL9A7kYctzwgh03nh9skBV7JUC+ANjkJzCJJKt56oLg5
	pcIJtdJnlFGB6Oaxv0iRirXkDbc6Ge64iqrdSl9KsFHDlYyhc5GvRML6jIRfwLCzSGUX
	hEBoNqsSlNYb+NfAWvLf43foFUjhtQ4BOlcpmWXQrKXEoiopSVyoTorzD7Vsk+fP1cN4
	HiwsrsuZw12qOl6qUlKteKAeA0HqJ87iS246t7x6gDk5jRdkR/GbMtqvrCV6Y34GQ1YR
	B0dw==
X-Received: by 10.140.81.176 with SMTP id f45mr21957115qgd.62.1413055120152;
	Sat, 11 Oct 2014 12:18:40 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Sat, 11 Oct 2014 12:17:59 -0700 (PDT)
In-Reply-To: <CANyK_8cZMz-JBdWku-yTgA1+RXbt0wGxww+eCf2CBMeb4cFXdA@mail.gmail.com>
References: <54380D3A.8060904@urbanec.net>
	<CANyK_8cZMz-JBdWku-yTgA1+RXbt0wGxww+eCf2CBMeb4cFXdA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sat, 11 Oct 2014 20:17:59 +0100
X-Google-Sender-Auth: bhIACmmK8jUNRioK1LBei0ynyoU
Message-ID: <CANyK_8cZGNxd0=FKA1NK1Y69RaHT4bVry_FjixuQCMW1zPpsLA@mail.gmail.com>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Better support for upgrading packages in opkg and update-rc.d.bbclass
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
X-List-Received-Date: Sat, 11 Oct 2014 19:18:41 -0000
Content-Type: text/plain; charset=UTF-8

On 11 October 2014 15:41, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 10 October 2014 17:45, Peter Urbanec <openembedded-devel@urbanec.net> wrote:
>> +diff --git a/libopkg/opkg_remove.c b/libopkg/opkg_remove.c
>> +index 07401b2..52454f8 100644
>> +--- a/libopkg/opkg_remove.c
>> ++++ b/libopkg/opkg_remove.c
>> +@@ -292,7 +292,7 @@ opkg_remove_pkg(pkg_t *pkg, int from_upgrade)
>> +      pkg->state_want = SW_DEINSTALL;
>> +      opkg_state_changed++;
>> + +-     if (pkg_run_script(pkg, "prerm", "remove") != 0) {
>> ++     if (pkg_run_script(pkg, "prerm", from_upgrade ? "upgrade" : "remove") != 0) {
>> +          if (!conf->force_remove) {
>> +              opkg_msg(ERROR, "not removing package \"%s\", "
>> +                              "prerm script failed\n", pkg->name);
>> +@@ -310,7 +310,7 @@ opkg_remove_pkg(pkg_t *pkg, int from_upgrade)
>> +        feel free to fix this. */
>> +      remove_data_files_and_list(pkg);
>> +
>> +-     err = pkg_run_script(pkg, "postrm", "remove");
>> ++     err = pkg_run_script(pkg, "postrm", from_upgrade ? "upgrade" : "remove");
>> +
>> +      remove_maintainer_scripts(pkg);
>> +      pkg->state_status = SS_NOT_INSTALLED;
>
> I'm happy with this change, both here and upstream.
>

I think I need to take that back - the crappiness of the legacy code
in opkg strikes again!

opkg_remove_pkg is never called with from_upgrade set to a non-zero
value. The removal of an old package during an upgrade is handled by
directly calling remove_data_files_and_list and
remove_maintainer_scripts from opkg_install_pkg. The desired behaviour
is given in the comments in prerm_upgrade_old_pkg in opkg_install.c,
the behaviour given by the comment in that function just needs
implementing.

This is already entered as issue 104 in the opkg issue tracker:
https://code.google.com/p/opkg/issues/detail?id=104

Have you tested this patch before submitting it?

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

