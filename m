Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3008BC43219
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:18 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.26043.1668880090348337760
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=29YBZbql;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id k15so7797951pfg.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCILu5G4oZ7MKaP7F7cLPGWvq2IL/Wp5Xy/OVKpJWvk=;
        b=29YBZbqljDgywCyLYdc0WGaSFnZb73DAaYsjZXI3OUVjfY9QVdw+ycgfyOn4mH7FN6
         /fpoV/64hkxe70I4X8r93mV8l/5BGL09QmcMyAJCZCB74MoviIu5Smbis4wIf3lcN5yK
         u3p1j21Mmh5rER6NuVhS/cDeuQkVsBp219PrraeWAKpBWU9TilQTKh6EO7OqfE/YK8d6
         FQeMI21psfUeFPrVMHXtX5TUtIdAcjOA6m5PpzUf2tun3YncHxU0vxrVnSRk/DYfH0Wg
         xk0wETIA+eG7TgXKWSWj4q/4ZiLwzGPUVNJfh6HOZsiS2q4DIZQ5Ufu6extoBW9YCdln
         +Zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCILu5G4oZ7MKaP7F7cLPGWvq2IL/Wp5Xy/OVKpJWvk=;
        b=E2t92MQ7daRK5h82IsiNjXEF56aMPrvUenShEcv4ijvkGOiB0FYpRu6WXyhz/fEh8O
         1Qhq9FiW9f3OuZY4SeO8uXKFGtX6fwmHOrgHGRy2956OwWhih5eYXfJoCAu0zkFWuvw+
         Gk4GNBEqEILCHvoSVhFsUkKdr9MkehHLBK4jGG7IdcCUU07HtDZ4d+rgC5RxlvDND4Q1
         E7+eVEl82pM2K/V4+9cb4FzT4PMgZXW3dmT8FsLA5n1TDoMvI2PyJ+S4p42ztke5Cp+F
         1n7WxB/vwbUpP7U2z6nLBktyOJi+wL61SHIFdwqjHImC01Q4PFDzWiDFAFG+IgW28zgb
         Y6VA==
X-Gm-Message-State: ANoB5pk6j7JJeDpxuBrKeM+jiiTpA84d0RRDbzE8AP+X7TZ3xi2NL4KP
	4B0K+gLvEJrlm5kTEuih69/lDWwF6CGgJH5vSbk=
X-Google-Smtp-Source: AA0mqf65xq0EO1bvLT4hNDcvXIPxi6RcuHrLB8gqk/sEsKir796jIeR8cIGedANUwU3OstVKdiZ6AA==
X-Received: by 2002:a05:6a00:2b4:b0:537:51d3:db1b with SMTP id q20-20020a056a0002b400b0053751d3db1bmr2902329pfs.42.1668880088968;
        Sat, 19 Nov 2022 09:48:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/21] golang: fix CVE-2021-33195
Date: Sat, 19 Nov 2022 07:47:35 -1000
Message-Id: <e9c6fb8605131d059d23a3dacf9de4fd8afc7d09.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173525

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Upstream-Status: Backport [https://github.com/golang/go/commit/31d60cda1f58b7558fc5725d2b9e4531655d980e]
CVE: CVE-2021-33195
Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2021-33195.patch           | 373 ++++++++++++++++++
 2 files changed, 374 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-33195.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index e8ff1c4ec9..3814bf0149 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -43,6 +43,7 @@ SRC_URI += "\
     file://0004-CVE-2022-32190.patch \
     file://CVE-2022-2880.patch \
     file://CVE-2022-2879.patch \
+    file://CVE-2021-33195.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-33195.patch b/meta/recipes-devtools/go/go-1.14/CVE-2021-33195.patch
new file mode 100644
index 0000000000..3d9de888ff
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-33195.patch
@@ -0,0 +1,373 @@
+From 9324d7e53151e9dfa4b25af994a28c2e0b11f729 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Thu, 27 May 2021 10:40:06 -0700
+Subject: [PATCH] net: verify results from Lookup* are valid domain names
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/31d60cda1f58b7558fc5725d2b9e4531655d980e]
+CVE: CVE-2021-33195
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+
+
+For the methods LookupCNAME, LookupSRV, LookupMX, LookupNS, and
+LookupAddr check that the returned domain names are in fact valid DNS
+names using the existing isDomainName function.
+
+Thanks to Philipp Jeitner and Haya Shulman from Fraunhofer SIT for
+reporting this issue.
+
+Updates #46241
+Fixes #46356
+Fixes CVE-2021-33195
+
+Change-Id: I47a4f58c031cb752f732e88bbdae7f819f0af4f3
+Reviewed-on: https://go-review.googlesource.com/c/go/+/323131
+Trust: Roland Shoemaker <roland@golang.org>
+Run-TryBot: Roland Shoemaker <roland@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Filippo Valsorda <filippo@golang.org>
+Reviewed-by: Katie Hockman <katie@golang.org>
+(cherry picked from commit cdcd02842da7c004efd023881e3719105209c908)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/323269
+---
+ src/net/dnsclient_unix_test.go | 157 +++++++++++++++++++++++++++++++++
+ src/net/lookup.go              | 111 ++++++++++++++++++++---
+ 2 files changed, 255 insertions(+), 13 deletions(-)
+
+diff --git a/src/net/dnsclient_unix_test.go b/src/net/dnsclient_unix_test.go
+index 2ad40df..b8617d9 100644
+--- a/src/net/dnsclient_unix_test.go
++++ b/src/net/dnsclient_unix_test.go
+@@ -1800,3 +1800,160 @@ func TestPTRandNonPTR(t *testing.T) {
+ 		t.Errorf("names = %q; want %q", names, want)
+ 	}
+ }
++
++func TestCVE202133195(t *testing.T) {
++	fake := fakeDNSServer{
++		rh: func(n, _ string, q dnsmessage.Message, _ time.Time) (dnsmessage.Message, error) {
++			r := dnsmessage.Message{
++				Header: dnsmessage.Header{
++					ID:                 q.Header.ID,
++					Response:           true,
++					RCode:              dnsmessage.RCodeSuccess,
++					RecursionAvailable: true,
++				},
++				Questions: q.Questions,
++			}
++			switch q.Questions[0].Type {
++			case dnsmessage.TypeCNAME:
++				r.Answers = []dnsmessage.Resource{}
++			case dnsmessage.TypeA: // CNAME lookup uses a A/AAAA as a proxy
++				r.Answers = append(r.Answers,
++					dnsmessage.Resource{
++						Header: dnsmessage.ResourceHeader{
++							Name:   dnsmessage.MustNewName("<html>.golang.org."),
++							Type:   dnsmessage.TypeA,
++							Class:  dnsmessage.ClassINET,
++							Length: 4,
++						},
++						Body: &dnsmessage.AResource{
++							A: TestAddr,
++						},
++					},
++				)
++			case dnsmessage.TypeSRV:
++				n := q.Questions[0].Name
++				if n.String() == "_hdr._tcp.golang.org." {
++					n = dnsmessage.MustNewName("<html>.golang.org.")
++				}
++				r.Answers = append(r.Answers,
++					dnsmessage.Resource{
++						Header: dnsmessage.ResourceHeader{
++							Name:   n,
++							Type:   dnsmessage.TypeSRV,
++							Class:  dnsmessage.ClassINET,
++							Length: 4,
++						},
++						Body: &dnsmessage.SRVResource{
++							Target: dnsmessage.MustNewName("<html>.golang.org."),
++						},
++					},
++				)
++			case dnsmessage.TypeMX:
++				r.Answers = append(r.Answers,
++					dnsmessage.Resource{
++						Header: dnsmessage.ResourceHeader{
++							Name:   dnsmessage.MustNewName("<html>.golang.org."),
++							Type:   dnsmessage.TypeMX,
++							Class:  dnsmessage.ClassINET,
++							Length: 4,
++						},
++						Body: &dnsmessage.MXResource{
++							MX: dnsmessage.MustNewName("<html>.golang.org."),
++						},
++					},
++				)
++			case dnsmessage.TypeNS:
++				r.Answers = append(r.Answers,
++					dnsmessage.Resource{
++						Header: dnsmessage.ResourceHeader{
++							Name:   dnsmessage.MustNewName("<html>.golang.org."),
++							Type:   dnsmessage.TypeNS,
++							Class:  dnsmessage.ClassINET,
++							Length: 4,
++						},
++						Body: &dnsmessage.NSResource{
++							NS: dnsmessage.MustNewName("<html>.golang.org."),
++						},
++					},
++				)
++			case dnsmessage.TypePTR:
++				r.Answers = append(r.Answers,
++					dnsmessage.Resource{
++						Header: dnsmessage.ResourceHeader{
++							Name:   dnsmessage.MustNewName("<html>.golang.org."),
++							Type:   dnsmessage.TypePTR,
++							Class:  dnsmessage.ClassINET,
++							Length: 4,
++						},
++						Body: &dnsmessage.PTRResource{
++							PTR: dnsmessage.MustNewName("<html>.golang.org."),
++						},
++					},
++				)
++			}
++			return r, nil
++		},
++	}
++
++	r := Resolver{PreferGo: true, Dial: fake.DialContext}
++	// Change the default resolver to match our manipulated resolver
++	originalDefault := DefaultResolver
++	DefaultResolver = &r
++	defer func() {
++		DefaultResolver = originalDefault
++	}()
++
++	_, err := r.LookupCNAME(context.Background(), "golang.org")
++	if expected := "lookup golang.org: CNAME target is invalid"; err == nil || err.Error() != expected {
++		t.Errorf("Resolver.LookupCNAME returned unexpected error, got %q, want %q", err.Error(), expected)
++	}
++	_, err = LookupCNAME("golang.org")
++	if expected := "lookup golang.org: CNAME target is invalid"; err == nil || err.Error() != expected {
++		t.Errorf("LookupCNAME returned unexpected error, got %q, want %q", err.Error(), expected)
++	}
++
++	_, _, err = r.LookupSRV(context.Background(), "target", "tcp", "golang.org")
++	if expected := "lookup golang.org: SRV target is invalid"; err == nil || err.Error() != expected {
++		t.Errorf("Resolver.LookupSRV returned unexpected error, got %q, want %q", err.Error(), expected)
++	}
++	_, _, err = LookupSRV("target", "tcp", "golang.org")
++	if expected := "lookup golang.org: SRV target is invalid"; err == nil || err.Error() != expected {
++		t.Errorf("LookupSRV returned unexpected error, got %q, want %q", err.Error(), expected)
++	}
++
++	_, _, err = r.LookupSRV(context.Background(), "hdr", "tcp", "golang.org")
++	if expected := "lookup golang.org: SRV header name is invalid"; err == nil || err.Error() != expected {
++		t.Errorf("Resolver.LookupSRV returned unexpected error, got %q, want %q", err.Error(), expected)
++	}
++	_, _, err = LookupSRV("hdr", "tcp", "golang.org")
++	if expected := "lookup golang.org: SRV header name is invalid"; err == nil || err.Error() != expected {
++		t.Errorf("LookupSRV returned unexpected error, got %q, want %q", err.Error(), expected)
++	}
++
++	_, err = r.LookupMX(context.Background(), "golang.org")
++	if expected := "lookup golang.org: MX target is invalid"; err == nil || err.Error() != expected {
++		t.Errorf("Resolver.LookupMX returned unexpected error, got %q, want %q", err.Error(), expected)
++	}
++	_, err = LookupMX("golang.org")
++	if expected := "lookup golang.org: MX target is invalid"; err == nil || err.Error() != expected {
++		t.Errorf("LookupMX returned unexpected error, got %q, want %q", err.Error(), expected)
++	}
++
++	_, err = r.LookupNS(context.Background(), "golang.org")
++	if expected := "lookup golang.org: NS target is invalid"; err == nil || err.Error() != expected {
++		t.Errorf("Resolver.LookupNS returned unexpected error, got %q, want %q", err.Error(), expected)
++	}
++	_, err = LookupNS("golang.org")
++	if expected := "lookup golang.org: NS target is invalid"; err == nil || err.Error() != expected {
++		t.Errorf("LookupNS returned unexpected error, got %q, want %q", err.Error(), expected)
++	}
++
++	_, err = r.LookupAddr(context.Background(), "1.2.3.4")
++	if expected := "lookup 1.2.3.4: PTR target is invalid"; err == nil || err.Error() != expected {
++		t.Errorf("Resolver.LookupAddr returned unexpected error, got %q, want %q", err.Error(), expected)
++	}
++	_, err = LookupAddr("1.2.3.4")
++	if expected := "lookup 1.2.3.4: PTR target is invalid"; err == nil || err.Error() != expected {
++		t.Errorf("LookupAddr returned unexpected error, got %q, want %q", err.Error(), expected)
++	}
++}
+diff --git a/src/net/lookup.go b/src/net/lookup.go
+index 9cebd10..05e88e4 100644
+--- a/src/net/lookup.go
++++ b/src/net/lookup.go
+@@ -364,8 +364,11 @@ func (r *Resolver) LookupPort(ctx context.Context, network, service string) (por
+ // LookupCNAME does not return an error if host does not
+ // contain DNS "CNAME" records, as long as host resolves to
+ // address records.
++//
++// The returned canonical name is validated to be a properly
++// formatted presentation-format domain name.
+ func LookupCNAME(host string) (cname string, err error) {
+-	return DefaultResolver.lookupCNAME(context.Background(), host)
++	return DefaultResolver.LookupCNAME(context.Background(), host)
+ }
+ 
+ // LookupCNAME returns the canonical name for the given host.
+@@ -378,8 +381,18 @@ func LookupCNAME(host string) (cname string, err error) {
+ // LookupCNAME does not return an error if host does not
+ // contain DNS "CNAME" records, as long as host resolves to
+ // address records.
+-func (r *Resolver) LookupCNAME(ctx context.Context, host string) (cname string, err error) {
+-	return r.lookupCNAME(ctx, host)
++//
++// The returned canonical name is validated to be a properly
++// formatted presentation-format domain name.
++func (r *Resolver) LookupCNAME(ctx context.Context, host string) (string, error) {
++	cname, err := r.lookupCNAME(ctx, host)
++	if err != nil {
++		return "", err
++	}
++	if !isDomainName(cname) {
++		return "", &DNSError{Err: "CNAME target is invalid", Name: host}
++	}
++	return cname, nil
+ }
+ 
+ // LookupSRV tries to resolve an SRV query of the given service,
+@@ -391,8 +404,11 @@ func (r *Resolver) LookupCNAME(ctx context.Context, host string) (cname string,
+ // That is, it looks up _service._proto.name. To accommodate services
+ // publishing SRV records under non-standard names, if both service
+ // and proto are empty strings, LookupSRV looks up name directly.
++//
++// The returned service names are validated to be properly
++// formatted presentation-format domain names.
+ func LookupSRV(service, proto, name string) (cname string, addrs []*SRV, err error) {
+-	return DefaultResolver.lookupSRV(context.Background(), service, proto, name)
++	return DefaultResolver.LookupSRV(context.Background(), service, proto, name)
+ }
+ 
+ // LookupSRV tries to resolve an SRV query of the given service,
+@@ -404,28 +420,82 @@ func LookupSRV(service, proto, name string) (cname string, addrs []*SRV, err err
+ // That is, it looks up _service._proto.name. To accommodate services
+ // publishing SRV records under non-standard names, if both service
+ // and proto are empty strings, LookupSRV looks up name directly.
+-func (r *Resolver) LookupSRV(ctx context.Context, service, proto, name string) (cname string, addrs []*SRV, err error) {
+-	return r.lookupSRV(ctx, service, proto, name)
++//
++// The returned service names are validated to be properly
++// formatted presentation-format domain names.
++func (r *Resolver) LookupSRV(ctx context.Context, service, proto, name string) (string, []*SRV, error) {
++	cname, addrs, err := r.lookupSRV(ctx, service, proto, name)
++	if err != nil {
++		return "", nil, err
++	}
++	if cname != "" && !isDomainName(cname) {
++		return "", nil, &DNSError{Err: "SRV header name is invalid", Name: name}
++	}
++	for _, addr := range addrs {
++		if addr == nil {
++			continue
++		}
++		if !isDomainName(addr.Target) {
++			return "", nil, &DNSError{Err: "SRV target is invalid", Name: name}
++		}
++	}
++	return cname, addrs, nil
+ }
+ 
+ // LookupMX returns the DNS MX records for the given domain name sorted by preference.
++//
++// The returned mail server names are validated to be properly
++// formatted presentation-format domain names.
+ func LookupMX(name string) ([]*MX, error) {
+-	return DefaultResolver.lookupMX(context.Background(), name)
++	return DefaultResolver.LookupMX(context.Background(), name)
+ }
+ 
+ // LookupMX returns the DNS MX records for the given domain name sorted by preference.
++//
++// The returned mail server names are validated to be properly
++// formatted presentation-format domain names.
+ func (r *Resolver) LookupMX(ctx context.Context, name string) ([]*MX, error) {
+-	return r.lookupMX(ctx, name)
++	records, err := r.lookupMX(ctx, name)
++	if err != nil {
++		return nil, err
++	}
++	for _, mx := range records {
++		if mx == nil {
++			continue
++		}
++		if !isDomainName(mx.Host) {
++			return nil, &DNSError{Err: "MX target is invalid", Name: name}
++		}
++	}
++	return records, nil
+ }
+ 
+ // LookupNS returns the DNS NS records for the given domain name.
++//
++// The returned name server names are validated to be properly
++// formatted presentation-format domain names.
+ func LookupNS(name string) ([]*NS, error) {
+-	return DefaultResolver.lookupNS(context.Background(), name)
++	return DefaultResolver.LookupNS(context.Background(), name)
+ }
+ 
+ // LookupNS returns the DNS NS records for the given domain name.
++//
++// The returned name server names are validated to be properly
++// formatted presentation-format domain names.
+ func (r *Resolver) LookupNS(ctx context.Context, name string) ([]*NS, error) {
+-	return r.lookupNS(ctx, name)
++	records, err := r.lookupNS(ctx, name)
++	if err != nil {
++		return nil, err
++	}
++	for _, ns := range records {
++		if ns == nil {
++			continue
++		}
++		if !isDomainName(ns.Host) {
++			return nil, &DNSError{Err: "NS target is invalid", Name: name}
++		}
++	}
++	return records, nil
+ }
+ 
+ // LookupTXT returns the DNS TXT records for the given domain name.
+@@ -441,14 +511,29 @@ func (r *Resolver) LookupTXT(ctx context.Context, name string) ([]string, error)
+ // LookupAddr performs a reverse lookup for the given address, returning a list
+ // of names mapping to that address.
+ //
++// The returned names are validated to be properly formatted presentation-format
++// domain names.
++//
+ // When using the host C library resolver, at most one result will be
+ // returned. To bypass the host resolver, use a custom Resolver.
+ func LookupAddr(addr string) (names []string, err error) {
+-	return DefaultResolver.lookupAddr(context.Background(), addr)
++	return DefaultResolver.LookupAddr(context.Background(), addr)
+ }
+ 
+ // LookupAddr performs a reverse lookup for the given address, returning a list
+ // of names mapping to that address.
+-func (r *Resolver) LookupAddr(ctx context.Context, addr string) (names []string, err error) {
+-	return r.lookupAddr(ctx, addr)
++//
++// The returned names are validated to be properly formatted presentation-format
++// domain names.
++func (r *Resolver) LookupAddr(ctx context.Context, addr string) ([]string, error) {
++	names, err := r.lookupAddr(ctx, addr)
++	if err != nil {
++		return nil, err
++	}
++	for _, name := range names {
++		if !isDomainName(name) {
++			return nil, &DNSError{Err: "PTR target is invalid", Name: addr}
++		}
++	}
++	return names, nil
+ }
-- 
2.25.1


