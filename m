Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F588C71135
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:38:50 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.96539.1749584329946856888
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PU5VT15K;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-747fc7506d4so5550370b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584329; x=1750189129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxivQ2oAS2r2fDfDiRzKYS1lB9RhfkwHSW3O6ZHZzZ8=;
        b=PU5VT15Kp4+cBlOOUohIM++S7HCZ/CEsu5+MjfonIwRhzHWBxFNr8BOvCDU+DwmWrN
         8uQTj3sEf3TXN32pnqhqkG0Pr0uyTcnPPUv+zUhzyq9sOZ3Q9n2522nXjxWNP1fO0Jlz
         +JWv9nmVJ53FR/PNg7btkM9lDZNBaMM9iSlllhoVWNIcUJU0LKayZ4+fNLJFYkX2EbDJ
         I5kgCrfT0y/nrQI58RvBsTw1p47dq39RNn98IwGT2uV1aQ/R85HEVBCkNaK23Kfg3qp/
         uvlt85hYAcEgO9mnxT4zPTcBjbCyDmz/rqt5N9gkbDrldLfWCFOLkFcFZnk4V6fd+JqM
         BJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584329; x=1750189129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxivQ2oAS2r2fDfDiRzKYS1lB9RhfkwHSW3O6ZHZzZ8=;
        b=T1le5CsWpWnXYeKv3P7yRlTS9+XQRm9PUjc3qvyrMhGaYaJ/8PHyQwaWVH+8fTq4Xj
         8RdNJgXtDojia/PL8JkdR9X6UqYpqviNJz6OSRpCVd/ctam/kw4AFyfOBJEv+1W7i47r
         ApeYSRPI+uMBLb6lJstKHmDrSZEOLeIRarNTJ2r3bFui/u5Yku9hvr5AAcqP+qSmCrNs
         yCeLMh7paej+EQ42LBSZYV7uxy02474OpLSsFzdE1DyzIPjpJPP+6kPKWWr13fCg/fwv
         TePVN07tcqp8SikYfl/8ARnqBw12MEuK7rh1be0ybV6EI4Trw6CqRxUb+kYuJ2HZNFBz
         N4Fg==
X-Gm-Message-State: AOJu0YxydbqejEykzfrSDsI93IUyHDjw4RMqwKLcFaU5h6ie2aTqU2df
	bbvLGFz3Ce9yRaC3jQjwkZd7so1rP8UrQPext/4s1+ycJJYq85NP9pauhuf5f3GMUzuDddIHXCp
	j+LNa
X-Gm-Gg: ASbGnctqFiVlvq4CHVvMzp9fQNrrFKKlOkcRwscQ9CuQyT267Xvw7J4dt/bQk+Ua93S
	DMe8MOw4Y9JasALnMA5Q0KnNqVOoTbHnNb9eJ90WHD24Wua+l39CBOeYMNYvH4GTUOwd961/1Pp
	k/aOSYnu9UH3zWU38aj73MW3phjHSWQnn3gdf+gs9r0JTL6rrlibMQPLOmup1+iEzogseX6hS+c
	excaCOlPrIktjyTILVG1z0MAMpVTWU69qgwMzwUdC4mBP0K+GahF7AZmBMdO1sNSKyTODDBxrS7
	plJts8cYsEBKhset77iRqbF23C8rik+GCYDntO/2aaA8dDL/HohGFg==
X-Google-Smtp-Source: AGHT+IFE+MPBrLHX7gk71Zd2UIdvpVQdbR7GC0fMO1QJgcylcJ10mmqg3hbH0KbTXk3Eq13nGkOB4g==
X-Received: by 2002:a05:6a21:900e:b0:1f5:95a7:8159 with SMTP id adf61e73a8af0-21f8664f2f3mr1109367637.10.1749584328747;
        Tue, 10 Jun 2025 12:38:48 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/15] git: Fix CVE-2024-50349 and CVE-2024-52006
Date: Tue, 10 Jun 2025 12:38:19 -0700
Message-ID: <ed112b58ad0d40bfa36e53a370e964e6a20d694e.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218434

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://github.com/git/git/commit/c903985bf7e772e2d08275c1a95c8a55ab011577
&
https://github.com/git/git/commit/7725b8100ffbbff2750ee4d61a0fcc1f53a086e8
& https://github.com/git/git/commit/b01b9b81d36759cdcd07305e78765199e1bc2060

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../git/git/CVE-2024-50349-0001.patch         | 100 ++++++
 .../git/git/CVE-2024-50349-0002.patch         | 321 ++++++++++++++++++
 .../git/git/CVE-2024-52006.patch              | 165 +++++++++
 meta/recipes-devtools/git/git_2.35.7.bb       |   3 +
 4 files changed, 589 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-50349-0001.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-50349-0002.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2024-52006.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2024-50349-0001.patch b/meta/recipes-devtools/git/git/CVE-2024-50349-0001.patch
new file mode 100644
index 0000000000..a4567f83f5
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2024-50349-0001.patch
@@ -0,0 +1,100 @@
+From c903985bf7e772e2d08275c1a95c8a55ab011577 Mon Sep 17 00:00:00 2001
+From: Johannes Schindelin <johannes.schindelin@gmx.de>
+Date: Thu, 7 Nov 2024 08:57:52 +0100
+Subject: [PATCH] credential_format(): also encode <host>[:<port>]
+
+An upcoming change wants to sanitize the credential password prompt
+where a URL is displayed that may potentially come from a `.gitmodules`
+file. To this end, the `credential_format()` function is employed.
+
+To sanitize the host name (and optional port) part of the URL, we need a
+new mode of the `strbuf_add_percentencode()` function because the
+current mode is both too strict and too lenient: too strict because it
+encodes `:`, `[` and `]` (which should be left unencoded in
+`<host>:<port>` and in IPv6 addresses), and too lenient because it does
+not encode invalid host name characters `/`, `_` and `~`.
+
+So let's introduce and use a new mode specifically to encode the host
+name and optional port part of a URI, leaving alpha-numerical
+characters, periods, colons and brackets alone and encoding all others.
+
+This only leads to a change of behavior for URLs that contain invalid
+host names.
+
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/c903985bf7e772e2d08275c1a95c8a55ab011577]
+CVE: CVE-2024-50349
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ credential.c           |  3 ++-
+ strbuf.c               |  4 +++-
+ strbuf.h               |  1 +
+ t/t0300-credentials.sh | 13 +++++++++++++
+ 4 files changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/credential.c b/credential.c
+index f32011343f9400..572f1785da7d3e 100644
+--- a/credential.c
++++ b/credential.c
+@@ -164,7 +164,8 @@ static void credential_format(struct credential *c, struct strbuf *out)
+ 		strbuf_addch(out, '@');
+ 	}
+ 	if (c->host)
+-		strbuf_addstr(out, c->host);
++		strbuf_add_percentencode(out, c->host,
++					 STRBUF_ENCODE_HOST_AND_PORT);
+ 	if (c->path) {
+ 		strbuf_addch(out, '/');
+ 		strbuf_add_percentencode(out, c->path, 0);
+diff --git a/strbuf.c b/strbuf.c
+index c383f41a3c5ccc..756b96c56157c3 100644
+--- a/strbuf.c
++++ b/strbuf.c
+@@ -492,7 +492,9 @@ void strbuf_add_percentencode(struct strbuf *dst, const char *src, int flags)
+ 		unsigned char ch = src[i];
+ 		if (ch <= 0x1F || ch >= 0x7F ||
+ 		    (ch == '/' && (flags & STRBUF_ENCODE_SLASH)) ||
+-		    strchr(URL_UNSAFE_CHARS, ch))
++		    ((flags & STRBUF_ENCODE_HOST_AND_PORT) ?
++		     !isalnum(ch) && !strchr("-.:[]", ch) :
++		     !!strchr(URL_UNSAFE_CHARS, ch)))
+ 			strbuf_addf(dst, "%%%02X", (unsigned char)ch);
+ 		else
+ 			strbuf_addch(dst, ch);
+diff --git a/strbuf.h b/strbuf.h
+index f6dbb9681ee768..f9f8bb0381b3c5 100644
+--- a/strbuf.h
++++ b/strbuf.h
+@@ -380,6 +380,7 @@ size_t strbuf_expand_dict_cb(struct strbuf *sb,
+ void strbuf_addbuf_percentquote(struct strbuf *dst, const struct strbuf *src);
+ 
+ #define STRBUF_ENCODE_SLASH 1
++#define STRBUF_ENCODE_HOST_AND_PORT 2
+ 
+ /**
+  * Append the contents of a string to a strbuf, percent-encoding any characters
+diff --git a/t/t0300-credentials.sh b/t/t0300-credentials.sh
+index c66d91e82d8bc7..cb91be1427f1d2 100755
+--- a/t/t0300-credentials.sh
++++ b/t/t0300-credentials.sh
+@@ -514,6 +514,19 @@ test_expect_success 'match percent-encoded values in username' '
+ 	EOF
+ '
+ 
++test_expect_success 'match percent-encoded values in hostname' '
++	test_config "credential.https://a%20b%20c/.helper" "$HELPER" &&
++	check fill <<-\EOF
++	url=https://a b c/
++	--
++	protocol=https
++	host=a b c
++	username=foo
++	password=bar
++	--
++	EOF
++'
++
+ test_expect_success 'fetch with multiple path components' '
+ 	test_unconfig credential.helper &&
+ 	test_config credential.https://example.com/foo/repo.git.helper "verbatim foo bar" &&
diff --git a/meta/recipes-devtools/git/git/CVE-2024-50349-0002.patch b/meta/recipes-devtools/git/git/CVE-2024-50349-0002.patch
new file mode 100644
index 0000000000..6135b00737
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2024-50349-0002.patch
@@ -0,0 +1,321 @@
+From 7725b8100ffbbff2750ee4d61a0fcc1f53a086e8 Mon Sep 17 00:00:00 2001
+From: Johannes Schindelin <johannes.schindelin@gmx.de>
+Date: Wed, 30 Oct 2024 13:26:10 +0100
+Subject: [PATCH] credential: sanitize the user prompt
+
+When asking the user interactively for credentials, we want to avoid
+misleading them e.g. via control sequences that pretend that the URL
+targets a trusted host when it does not.
+
+While Git learned, over the course of the preceding commits, to disallow
+URLs containing URL-encoded control characters by default, credential
+helpers are still allowed to specify values very freely (apart from Line
+Feed and NUL characters, anything is allowed), and this would allow,
+say, a username containing control characters to be specified that would
+then be displayed in the interactive terminal prompt asking the user for
+the password, potentially sending those control characters directly to
+the terminal. This is undesirable because control characters can be used
+to mislead users to divulge secret information to untrusted sites.
+
+To prevent such an attack vector, let's add a `git_prompt()` that forces
+the displayed text to be sanitized, i.e. displaying question marks
+instead of control characters.
+
+Note: While this commit's diff changes a lot of `user@host` strings to
+`user%40host`, which may look suspicious on the surface, there is a good
+reason for that: this string specifies a user name, not a
+<username>@<hostname> combination! In the context of t5541, the actual
+combination looks like this: `user%40@127.0.0.1:5541`. Therefore, these
+string replacements document a net improvement introduced by this
+commit, as `user@host@127.0.0.1` could have left readers wondering where
+the user name ends and where the host name begins.
+
+Hinted-at-by: Jeff King <peff@peff.net>
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/7725b8100ffbbff2750ee4d61a0fcc1f53a086e8]
+CVE: CVE-2024-50349
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Documentation/config/credential.txt |  6 ++++++
+ credential.c                        |  7 ++++++-
+ credential.h                        |  4 +++-
+ t/t0300-credentials.sh              | 20 ++++++++++++++++++++
+ t/t5541-http-push-smart.sh          |  6 +++---
+ t/t5550-http-fetch-dumb.sh          | 14 +++++++-------
+ t/t5551-http-fetch-smart.sh         | 16 ++++++++--------
+ 7 files changed, 53 insertions(+), 20 deletions(-)
+
+diff --git a/Documentation/config/credential.txt b/Documentation/config/credential.txt
+index 512f318..fd8113d 100644
+--- a/Documentation/config/credential.txt
++++ b/Documentation/config/credential.txt
+@@ -14,6 +14,12 @@ credential.useHttpPath::
+ 	or https URL to be important. Defaults to false. See
+ 	linkgit:gitcredentials[7] for more information.
+ 
++credential.sanitizePrompt::
++	By default, user names and hosts that are shown as part of the
++	password prompt are not allowed to contain control characters (they
++	will be URL-encoded by default). Configure this setting to `false` to
++	override that behavior.
++
+ credential.username::
+ 	If no username is set for a network authentication, use this username
+ 	by default. See credential.<context>.* below, and
+diff --git a/credential.c b/credential.c
+index 195556d..a071ead 100644
+--- a/credential.c
++++ b/credential.c
+@@ -66,6 +66,8 @@ static int credential_config_callback(const char *var, const char *value,
+ 	}
+ 	else if (!strcmp(key, "usehttppath"))
+ 		c->use_http_path = git_config_bool(var, value);
++	else if (!strcmp(key, "sanitizeprompt"))
++		c->sanitize_prompt = git_config_bool(var, value);
+ 
+ 	return 0;
+ }
+@@ -177,7 +179,10 @@ static char *credential_ask_one(const char *what, struct credential *c,
+ 	struct strbuf prompt = STRBUF_INIT;
+ 	char *r;
+ 
+-	credential_describe(c, &desc);
++	if (c->sanitize_prompt)
++		credential_format(c, &desc);
++	else
++		credential_describe(c, &desc);
+ 	if (desc.len)
+ 		strbuf_addf(&prompt, "%s for '%s': ", what, desc.buf);
+ 	else
+diff --git a/credential.h b/credential.h
+index f430e77..222bbf1 100644
+--- a/credential.h
++++ b/credential.h
+@@ -119,7 +119,8 @@ struct credential {
+ 		 configured:1,
+ 		 quit:1,
+ 		 use_http_path:1,
+-		 username_from_proto:1;
++		 username_from_proto:1,
++		 sanitize_prompt:1;
+ 
+ 	char *username;
+ 	char *password;
+@@ -130,6 +131,7 @@ struct credential {
+ 
+ #define CREDENTIAL_INIT { \
+ 	.helpers = STRING_LIST_INIT_DUP, \
++	.sanitize_prompt = 1, \
+ }
+ 
+ /* Initialize a credential structure, setting all fields to empty. */
+diff --git a/t/t0300-credentials.sh b/t/t0300-credentials.sh
+index c13be4f..9e27499 100755
+--- a/t/t0300-credentials.sh
++++ b/t/t0300-credentials.sh
+@@ -35,6 +35,10 @@ test_expect_success 'setup helper scripts' '
+ 	test -z "$pass" || echo password=$pass
+ 	EOF
+ 
++	write_script git-credential-cntrl-in-username <<-\EOF &&
++	printf "username=\\007latrix Lestrange\\n"
++	EOF
++
+ 	PATH="$PWD:$PATH"
+ '
+ 
+@@ -731,4 +735,20 @@ test_expect_success 'credential config with partial URLs' '
+ 	test_i18ngrep "skipping credential lookup for key" stderr
+ '
+ 
++BEL="$(printf '\007')"
++
++test_expect_success 'interactive prompt is sanitized' '
++	check fill cntrl-in-username <<-EOF
++	protocol=https
++	host=example.org
++	--
++	protocol=https
++	host=example.org
++	username=${BEL}latrix Lestrange
++	password=askpass-password
++	--
++	askpass: Password for ${SQ}https://%07latrix%20Lestrange@example.org${SQ}:
++	EOF
++'
++
+ test_done
+diff --git a/t/t5541-http-push-smart.sh b/t/t5541-http-push-smart.sh
+index 8ca50f8..66e7da0 100755
+--- a/t/t5541-http-push-smart.sh
++++ b/t/t5541-http-push-smart.sh
+@@ -363,7 +363,7 @@ test_expect_success 'push over smart http with auth' '
+ 	git push "$HTTPD_URL"/auth/smart/test_repo.git &&
+ 	git --git-dir="$HTTPD_DOCUMENT_ROOT_PATH/test_repo.git" \
+ 		log -1 --format=%s >actual &&
+-	expect_askpass both user@host &&
++	expect_askpass both user%40host &&
+ 	test_cmp expect actual
+ '
+ 
+@@ -375,7 +375,7 @@ test_expect_success 'push to auth-only-for-push repo' '
+ 	git push "$HTTPD_URL"/auth-push/smart/test_repo.git &&
+ 	git --git-dir="$HTTPD_DOCUMENT_ROOT_PATH/test_repo.git" \
+ 		log -1 --format=%s >actual &&
+-	expect_askpass both user@host &&
++	expect_askpass both user%40host &&
+ 	test_cmp expect actual
+ '
+ 
+@@ -405,7 +405,7 @@ test_expect_success 'push into half-auth-complete requires password' '
+ 	git push "$HTTPD_URL/half-auth-complete/smart/half-auth.git" &&
+ 	git --git-dir="$HTTPD_DOCUMENT_ROOT_PATH/half-auth.git" \
+ 		log -1 --format=%s >actual &&
+-	expect_askpass both user@host &&
++	expect_askpass both user%40host &&
+ 	test_cmp expect actual
+ '
+ 
+diff --git a/t/t5550-http-fetch-dumb.sh b/t/t5550-http-fetch-dumb.sh
+index 2592039..fed22e5 100755
+--- a/t/t5550-http-fetch-dumb.sh
++++ b/t/t5550-http-fetch-dumb.sh
+@@ -95,13 +95,13 @@ test_expect_success 'http auth can use user/pass in URL' '
+ test_expect_success 'http auth can use just user in URL' '
+ 	set_askpass wrong pass@host &&
+ 	git clone "$HTTPD_URL_USER/auth/dumb/repo.git" clone-auth-pass &&
+-	expect_askpass pass user@host
++	expect_askpass pass user%40host
+ '
+ 
+ test_expect_success 'http auth can request both user and pass' '
+ 	set_askpass user@host pass@host &&
+ 	git clone "$HTTPD_URL/auth/dumb/repo.git" clone-auth-both &&
+-	expect_askpass both user@host
++	expect_askpass both user%40host
+ '
+ 
+ test_expect_success 'http auth respects credential helper config' '
+@@ -119,14 +119,14 @@ test_expect_success 'http auth can get username from config' '
+ 	test_config_global "credential.$HTTPD_URL.username" user@host &&
+ 	set_askpass wrong pass@host &&
+ 	git clone "$HTTPD_URL/auth/dumb/repo.git" clone-auth-user &&
+-	expect_askpass pass user@host
++	expect_askpass pass user%40host
+ '
+ 
+ test_expect_success 'configured username does not override URL' '
+ 	test_config_global "credential.$HTTPD_URL.username" wrong &&
+ 	set_askpass wrong pass@host &&
+ 	git clone "$HTTPD_URL_USER/auth/dumb/repo.git" clone-auth-user2 &&
+-	expect_askpass pass user@host
++	expect_askpass pass user%40host
+ '
+ 
+ test_expect_success 'set up repo with http submodules' '
+@@ -147,7 +147,7 @@ test_expect_success 'cmdline credential config passes to submodule via clone' '
+ 	set_askpass wrong pass@host &&
+ 	git -c "credential.$HTTPD_URL.username=user@host" \
+ 		clone --recursive super super-clone &&
+-	expect_askpass pass user@host
++	expect_askpass pass user%40host
+ '
+ 
+ test_expect_success 'cmdline credential config passes submodule via fetch' '
+@@ -158,7 +158,7 @@ test_expect_success 'cmdline credential config passes submodule via fetch' '
+ 	git -C super-clone \
+ 	    -c "credential.$HTTPD_URL.username=user@host" \
+ 	    fetch --recurse-submodules &&
+-	expect_askpass pass user@host
++	expect_askpass pass user%40host
+ '
+ 
+ test_expect_success 'cmdline credential config passes submodule update' '
+@@ -175,7 +175,7 @@ test_expect_success 'cmdline credential config passes submodule update' '
+ 	git -C super-clone \
+ 	    -c "credential.$HTTPD_URL.username=user@host" \
+ 	    submodule update &&
+-	expect_askpass pass user@host
++	expect_askpass pass user%40host
+ '
+ 
+ test_expect_success 'fetch changes via http' '
+diff --git a/t/t5551-http-fetch-smart.sh b/t/t5551-http-fetch-smart.sh
+index f92c79c..53a21f6 100755
+--- a/t/t5551-http-fetch-smart.sh
++++ b/t/t5551-http-fetch-smart.sh
+@@ -142,7 +142,7 @@ test_expect_success 'clone from password-protected repository' '
+ 	echo two >expect &&
+ 	set_askpass user@host pass@host &&
+ 	git clone --bare "$HTTPD_URL/auth/smart/repo.git" smart-auth &&
+-	expect_askpass both user@host &&
++	expect_askpass both user%40host &&
+ 	git --git-dir=smart-auth log -1 --format=%s >actual &&
+ 	test_cmp expect actual
+ '
+@@ -160,7 +160,7 @@ test_expect_success 'clone from auth-only-for-objects repository' '
+ 	echo two >expect &&
+ 	set_askpass user@host pass@host &&
+ 	git clone --bare "$HTTPD_URL/auth-fetch/smart/repo.git" half-auth &&
+-	expect_askpass both user@host &&
++	expect_askpass both user%40host &&
+ 	git --git-dir=half-auth log -1 --format=%s >actual &&
+ 	test_cmp expect actual
+ '
+@@ -185,14 +185,14 @@ test_expect_success 'redirects send auth to new location' '
+ 	set_askpass user@host pass@host &&
+ 	git -c credential.useHttpPath=true \
+ 	  clone $HTTPD_URL/smart-redir-auth/repo.git repo-redir-auth &&
+-	expect_askpass both user@host auth/smart/repo.git
++	expect_askpass both user%40host auth/smart/repo.git
+ '
+ 
+ test_expect_success 'GIT_TRACE_CURL redacts auth details' '
+ 	rm -rf redact-auth trace &&
+ 	set_askpass user@host pass@host &&
+ 	GIT_TRACE_CURL="$(pwd)/trace" git clone --bare "$HTTPD_URL/auth/smart/repo.git" redact-auth &&
+-	expect_askpass both user@host &&
++	expect_askpass both user%40host &&
+ 
+ 	# Ensure that there is no "Basic" followed by a base64 string, but that
+ 	# the auth details are redacted
+@@ -204,7 +204,7 @@ test_expect_success 'GIT_CURL_VERBOSE redacts auth details' '
+ 	rm -rf redact-auth trace &&
+ 	set_askpass user@host pass@host &&
+ 	GIT_CURL_VERBOSE=1 git clone --bare "$HTTPD_URL/auth/smart/repo.git" redact-auth 2>trace &&
+-	expect_askpass both user@host &&
++	expect_askpass both user%40host &&
+ 
+ 	# Ensure that there is no "Basic" followed by a base64 string, but that
+ 	# the auth details are redacted
+@@ -217,7 +217,7 @@ test_expect_success 'GIT_TRACE_CURL does not redact auth details if GIT_TRACE_RE
+ 	set_askpass user@host pass@host &&
+ 	GIT_TRACE_REDACT=0 GIT_TRACE_CURL="$(pwd)/trace" \
+ 		git clone --bare "$HTTPD_URL/auth/smart/repo.git" redact-auth &&
+-	expect_askpass both user@host &&
++	expect_askpass both user%40host &&
+ 
+ 	grep -i "Authorization: Basic [0-9a-zA-Z+/]" trace
+ '
+@@ -524,7 +524,7 @@ test_expect_success 'http auth remembers successful credentials' '
+ 	# the first request prompts the user...
+ 	set_askpass user@host pass@host &&
+ 	git ls-remote "$HTTPD_URL/auth/smart/repo.git" >/dev/null &&
+-	expect_askpass both user@host &&
++	expect_askpass both user%40host &&
+ 
+ 	# ...and the second one uses the stored value rather than
+ 	# prompting the user.
+@@ -555,7 +555,7 @@ test_expect_success 'http auth forgets bogus credentials' '
+ 	# us to prompt the user again.
+ 	set_askpass user@host pass@host &&
+ 	git ls-remote "$HTTPD_URL/auth/smart/repo.git" >/dev/null &&
+-	expect_askpass both user@host
++	expect_askpass both user%40host
+ '
+ 
+ test_expect_success 'client falls back from v2 to v0 to match server' '
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/git/CVE-2024-52006.patch b/meta/recipes-devtools/git/git/CVE-2024-52006.patch
new file mode 100644
index 0000000000..403f9752b7
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2024-52006.patch
@@ -0,0 +1,165 @@
+From b01b9b81d36759cdcd07305e78765199e1bc2060 Mon Sep 17 00:00:00 2001
+From: Johannes Schindelin <johannes.schindelin@gmx.de>
+Date: Mon, 4 Nov 2024 14:48:22 +0100
+Subject: [PATCH] credential: disallow Carriage Returns in the protocol by
+ default
+
+While Git has documented that the credential protocol is line-based,
+with newlines as terminators, the exact shape of a newline has not been
+documented.
+
+From Git's perspective, which is firmly rooted in the Linux ecosystem,
+it is clear that "a newline" means a Line Feed character.
+
+However, even Git's credential protocol respects Windows line endings
+(a Carriage Return character followed by a Line Feed character, "CR/LF")
+by virtue of using `strbuf_getline()`.
+
+There is a third category of line endings that has been used originally
+by MacOS, and that is respected by the default line readers of .NET and
+node.js: bare Carriage Returns.
+
+Git cannot handle those, and what is worse: Git's remedy against
+CVE-2020-5260 does not catch when credential helpers are used that
+interpret bare Carriage Returns as newlines.
+
+Git Credential Manager addressed this as CVE-2024-50338, but other
+credential helpers may still be vulnerable. So let's not only disallow
+Line Feed characters as part of the values in the credential protocol,
+but also disallow Carriage Return characters.
+
+In the unlikely event that a credential helper relies on Carriage
+Returns in the protocol, introduce an escape hatch via the
+`credential.protectProtocol` config setting.
+
+This addresses CVE-2024-52006.
+
+Signed-off-by: Johannes Schindelin <johannes.schindelin@gmx.de>
+
+Upstream-Status: Backport [https://github.com/git/git/commit/b01b9b81d36759cdcd07305e78765199e1bc2060]
+CVE: CVE-2024-52006
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Documentation/config/credential.txt |  5 +++++
+ credential.c                        | 19 +++++++++++++------
+ credential.h                        |  4 +++-
+ t/t0300-credentials.sh              | 16 ++++++++++++++++
+ 4 files changed, 37 insertions(+), 7 deletions(-)
+
+diff --git a/Documentation/config/credential.txt b/Documentation/config/credential.txt
+index fd8113d..9cadca7 100644
+--- a/Documentation/config/credential.txt
++++ b/Documentation/config/credential.txt
+@@ -20,6 +20,11 @@ credential.sanitizePrompt::
+ 	will be URL-encoded by default). Configure this setting to `false` to
+ 	override that behavior.
+ 
++credential.protectProtocol::
++	By default, Carriage Return characters are not allowed in the protocol
++	that is used when Git talks to a credential helper. This setting allows
++	users to override this default.
++
+ credential.username::
+ 	If no username is set for a network authentication, use this username
+ 	by default. See credential.<context>.* below, and
+diff --git a/credential.c b/credential.c
+index a071ead..b427d55 100644
+--- a/credential.c
++++ b/credential.c
+@@ -68,6 +68,8 @@ static int credential_config_callback(const char *var, const char *value,
+ 		c->use_http_path = git_config_bool(var, value);
+ 	else if (!strcmp(key, "sanitizeprompt"))
+ 		c->sanitize_prompt = git_config_bool(var, value);
++	else if (!strcmp(key, "protectprotocol"))
++		c->protect_protocol = git_config_bool(var, value);
+ 
+ 	return 0;
+ }
+@@ -255,7 +257,8 @@ int credential_read(struct credential *c, FILE *fp)
+ 	return 0;
+ }
+ 
+-static void credential_write_item(FILE *fp, const char *key, const char *value,
++static void credential_write_item(const struct credential *c,
++				  FILE *fp, const char *key, const char *value,
+ 				  int required)
+ {
+ 	if (!value && required)
+@@ -264,16 +267,20 @@ static void credential_write_item(FILE *fp, const char *key, const char *value,
+ 		return;
+ 	if (strchr(value, '\n'))
+ 		die("credential value for %s contains newline", key);
++	if (c->protect_protocol && strchr(value, '\r'))
++		die("credential value for %s contains carriage return\n"
++		    "If this is intended, set `credential.protectProtocol=false`",
++		    key);
+ 	fprintf(fp, "%s=%s\n", key, value);
+ }
+ 
+ void credential_write(const struct credential *c, FILE *fp)
+ {
+-	credential_write_item(fp, "protocol", c->protocol, 1);
+-	credential_write_item(fp, "host", c->host, 1);
+-	credential_write_item(fp, "path", c->path, 0);
+-	credential_write_item(fp, "username", c->username, 0);
+-	credential_write_item(fp, "password", c->password, 0);
++	credential_write_item(c, fp, "protocol", c->protocol, 1);
++	credential_write_item(c, fp, "host", c->host, 1);
++	credential_write_item(c, fp, "path", c->path, 0);
++	credential_write_item(c, fp, "username", c->username, 0);
++	credential_write_item(c, fp, "password", c->password, 0);
+ }
+ 
+ static int run_credential_helper(struct credential *c,
+diff --git a/credential.h b/credential.h
+index 222bbf1..b4b837c 100644
+--- a/credential.h
++++ b/credential.h
+@@ -120,7 +120,8 @@ struct credential {
+ 		 quit:1,
+ 		 use_http_path:1,
+ 		 username_from_proto:1,
+-		 sanitize_prompt:1;
++		 sanitize_prompt:1,
++		 protect_protocol:1;
+ 
+ 	char *username;
+ 	char *password;
+@@ -132,6 +133,7 @@ struct credential {
+ #define CREDENTIAL_INIT { \
+ 	.helpers = STRING_LIST_INIT_DUP, \
+ 	.sanitize_prompt = 1, \
++	.protect_protocol = 1, \
+ }
+ 
+ /* Initialize a credential structure, setting all fields to empty. */
+diff --git a/t/t0300-credentials.sh b/t/t0300-credentials.sh
+index 9e27499..ca158fe 100755
+--- a/t/t0300-credentials.sh
++++ b/t/t0300-credentials.sh
+@@ -626,6 +626,22 @@ test_expect_success 'url parser rejects embedded newlines' '
+ 	test_cmp expect stderr
+ '
+ 
++test_expect_success 'url parser rejects embedded carriage returns' '
++	test_config credential.helper "!true" &&
++	test_must_fail git credential fill 2>stderr <<-\EOF &&
++	url=https://example%0d.com/
++	EOF
++	cat >expect <<-\EOF &&
++	fatal: credential value for host contains carriage return
++	If this is intended, set `credential.protectProtocol=false`
++	EOF
++	test_cmp expect stderr &&
++	GIT_ASKPASS=true \
++	git -c credential.protectProtocol=false credential fill <<-\EOF
++	url=https://example%0d.com/
++	EOF
++'
++
+ test_expect_success 'host-less URLs are parsed as empty host' '
+ 	check fill "verbatim foo bar" <<-\EOF
+ 	url=cert:///path/to/cert.pem
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/git_2.35.7.bb b/meta/recipes-devtools/git/git_2.35.7.bb
index 94352d38ef..765180a38d 100644
--- a/meta/recipes-devtools/git/git_2.35.7.bb
+++ b/meta/recipes-devtools/git/git_2.35.7.bb
@@ -23,6 +23,9 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://CVE-2024-32021-0001.patch \
            file://CVE-2024-32021-0002.patch \
            file://CVE-2024-32465.patch \
+           file://CVE-2024-50349-0001.patch \
+           file://CVE-2024-50349-0002.patch \
+           file://CVE-2024-52006.patch \
            "
 
 S = "${WORKDIR}/git-${PV}"
-- 
2.43.0


