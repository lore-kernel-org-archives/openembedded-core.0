Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A76C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 16:32:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.11216.1700152357428878923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 08:32:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YESx2SIj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A58F40003;
	Thu, 16 Nov 2023 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700152355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hOmM5KeYDZr4LuYUNoQxrrw288gyUOYRVeh5j1E8K7w=;
	b=YESx2SIjeXlWzo9DZS8nUlMHVkZ58MPCplHWlE5opFG4P1oRWj+KWvVVUtuDreeNBm1ydS
	jyBe3ddCkSnXzhZWhB8/VU/wn15wRCA2esKwxBXUD+X8c4fANLRQR61rzD3ABHn2i5hBeC
	ESsqwxqTwPIhHn8vh3eOgYdXkbv9q/4iIXnRlHMdGli8fULYAJVdZut2O1rbhYnx1pOke5
	WHvkDO8m4R60CQ6OQ9x67L1IJmiY/ZrOwFaGT7JZzTAtWdD8jSqHxlYxUSXOYcDa8dOCmb
	qVe04SMaoGSBGy1AXhY1Tjf/20gV8sZRdLsnjj3T04ruYkJzDAgdM2aoz2tJ7g==
Date: Thu, 16 Nov 2023 17:32:34 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: meenali.gupta@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH 4/5] avahi: fix CVE-2023-38472
Message-ID: <20231116163234fe55e02a@mail.local>
References: <20231116114450.1124133-1-meenali.gupta@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116114450.1124133-1-meenali.gupta@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 16:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190802

Please version properly your patches, this should have been v2.

Also please resend the whole series because now, I have to go and
cherry-pick patches from v1 because 5/5 doesn't apply standalone.

You hsould not push this work on the maintainers.

On 16/11/2023 11:44:50+0000, Meenali Gupta via lists.openembedded.org wrote:
> From: Meenali Gupta <meenali.gupta@windriver.com>
> 
> A vulnerability was found in Avahi. A reachable assertion exists
> in the avahi_rdata_parse() function.
> 
> Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> ---
>  meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
>  .../avahi/files/CVE-2023-38472.patch          | 46 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
> 
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> index 9c903d6868..84eb1c554d 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> @@ -29,6 +29,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/avahi-${PV}.tar.gz \
>             file://CVE-2023-38469.patch \
>             file://CVE-2023-38470.patch \
>             file://CVE-2023-38471.patch \
> +           file://CVE-2023-38472.patch \
>             "
>  
>  GITHUB_BASE_URI = "https://github.com/lathiat/avahi/releases/"
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
> new file mode 100644
> index 0000000000..a1de8e2a5a
> --- /dev/null
> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
> @@ -0,0 +1,46 @@
> +From 8cf606779dc356768afc6b70e53f2808a9655143 Mon Sep 17 00:00:00 2001
> +From: Michal Sekletar <msekleta@redhat.com>
> +Date: Thu, 19 Oct 2023 17:36:44 +0200
> +Subject: [PATCH] avahi: core: make sure there is rdata to process before
> + parsing it
> +
> +Fixes #452
> +
> +Upstream-Status: Backport [https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40]
> +CVE: CVE-2023-38472
> +
> +Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> +---
> + avahi-client/client-test.c      | 3 +++
> + avahi-daemon/dbus-entry-group.c | 2 +-
> + 2 files changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
> +index 7d04a6a..57750a4 100644
> +--- a/avahi-client/client-test.c
> ++++ b/avahi-client/client-test.c
> +@@ -258,6 +258,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
> +     printf("%s\n", avahi_strerror(avahi_entry_group_add_service (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "Lathiat's Site", "_http._tcp", NULL, NULL, 80, "foo=bar", NULL)));
> +     printf("add_record: %d\n", avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "\5booya", 6));
> +
> ++    error = avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
> ++    assert(error != AVAHI_OK);
> ++
> +     avahi_entry_group_commit (group);
> +
> +     domain = avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_callback, (char*) "omghai3u");
> +diff --git a/avahi-daemon/dbus-entry-group.c b/avahi-daemon/dbus-entry-group.c
> +index 4e879a5..aa23d4b 100644
> +--- a/avahi-daemon/dbus-entry-group.c
> ++++ b/avahi-daemon/dbus-entry-group.c
> +@@ -340,7 +340,7 @@ DBusHandlerResult avahi_dbus_msg_entry_group_impl(DBusConnection *c, DBusMessage
> +         if (!(r = avahi_record_new_full (name, clazz, type, ttl)))
> +             return avahi_dbus_respond_error(c, m, AVAHI_ERR_NO_MEMORY, NULL);
> +
> +-        if (avahi_rdata_parse (r, rdata, size) < 0) {
> ++        if (!rdata || avahi_rdata_parse (r, rdata, size) < 0) {
> +             avahi_record_unref (r);
> +             return avahi_dbus_respond_error(c, m, AVAHI_ERR_INVALID_RDATA, NULL);
> +         }
> +--
> +2.40.0
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190784): https://lists.openembedded.org/g/openembedded-core/message/190784
> Mute This Topic: https://lists.openembedded.org/mt/102625030/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

