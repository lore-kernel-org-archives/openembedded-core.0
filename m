Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web09.6525.1621333112981048109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 03:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=I/j+VqfU;
 spf=pass (domain: google.com, ip: 209.85.208.178, mailfrom: wak@google.com)
Received: by mail-lj1-f178.google.com with SMTP id v5so10863079ljg.12
        for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p8fcFFARfm1zJLIP4dby8+m2JKwA2j+zu7Ph5nCDafE=;
        b=I/j+VqfUcbYqwxlpB6kzW5t2hwp5Fw18aJ1DMYnyvgfMSnmB05XCOKVTQFM7xBr9W8
         Do3FXuPC7sKyG3W+itILeqFczziWU9CTy6moyk92jkLFs6u2Bu8a0bw6fbj8YPMfiyrA
         r7mKaRy8MTvSdtsqEsaAu8ozpfZrwbH9/XLbO4Odztagq5V1eLE/pVPT952xU4NtN0FX
         J+sRbTgXITpg6DcJIUyBd8n/KrRz31EK94NWnlobT2kY2+6Oou88DSMmx6QGvzLJ7eWo
         RYD9Tu/GM3VJg0wYMM5BXQJ2x5+qhSALuZAmwnn4A3ClWoYAF1z7CwD6h+b7OppTrW4e
         PWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p8fcFFARfm1zJLIP4dby8+m2JKwA2j+zu7Ph5nCDafE=;
        b=VE2vnef5k9krD4d6n0lWWA8FToqIPgp03iGUWqe7MMFEgFFKZCGzyjHuMxc4ZD239A
         PkjJ4CgvDrzbvguIrmhE2Hkozhq/RURPPnsld9DkrdXB9Gb7SPhgff0N/tjKkaM4el7J
         oB1VwGxwNkGt4WwzUWy806S4/iGMBDPCc62l3JD2mdxx/E7+GyIr7fTji83/mj+vKMiZ
         ucHKSNmd4bFQOPD6s48JPuzjD7rVsB/sZsqRiOKC5dYCOeBIikVIEJzKw9jxwLVqrRhI
         qrVTAPW3VUeIgrQg0hug+0iSVXt/O6b4LHu/gJ8c/sWYDPsNO/nl/wHuCJNphwAv9mnG
         w0lA==
X-Gm-Message-State: AOAM532RUhI7N+nqWkstoIoWvDYJX/ONWx3XRkU8Z57BzPnDIg/k8ixL
	Zu79EnvedFlh2loi2fXhjo42/m3juF97+3KW+pbvlg==
X-Google-Smtp-Source: ABdhPJw43w+IZFBAJXJzHSD69y/4AdiEVi+zkf8tpTyY0f3l3b2J6gMzkvX++SJiXrRtggJSTmu7oABCITUXZzkhSbo=
X-Received: by 2002:a2e:8ec5:: with SMTP id e5mr3594424ljl.325.1621333110932;
 Tue, 18 May 2021 03:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210517225101.1100864-1-wak@google.com> <CANNYZj_ByZv2buE+eEaGJZedSiyFcHtoqq6sSs3YKr_acMxkng@mail.gmail.com>
In-Reply-To: <CANNYZj_ByZv2buE+eEaGJZedSiyFcHtoqq6sSs3YKr_acMxkng@mail.gmail.com>
From: "William A. Kennington III" <wak@google.com>
Date: Tue, 18 May 2021 03:18:19 -0700
Message-ID: <CAPnigK=vSqu+NXskcqrEjWDNb5nvta3-4BZhNtXZSarHTQ=qiw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] systemd: Fix static neighbor creation in networkd
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

It would be nice, but it was non-trivial so I opted to go this path
first. These patches can be dropped once v248.2 is brought in.

On Tue, May 18, 2021 at 2:26 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> At this point it might be better to update systemd itself to 248?
>
> Alex
>
> On Tue, 18 May 2021 at 00:51, William A. Kennington III via lists.openembedded.org <wak=google.com@lists.openembedded.org> wrote:
>>
>> Backport a patch to fix the creation of static neighbors.
>>
>> Signed-off-by: William A. Kennington III <wak@google.com>
>> ---
>>  ...or-Always-add-neighbors-with-replace.patch | 50 +++++++++++++++++++
>>  meta/recipes-core/systemd/systemd_247.6.bb    |  1 +
>>  2 files changed, 51 insertions(+)
>>  create mode 100644 meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch
>>
>> diff --git a/meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch b/meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch
>> new file mode 100644
>> index 0000000000..5593c3f479
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch
>> @@ -0,0 +1,50 @@
>> +From faa0f758bc2f194d63bbed6e7f91df176f594a06 Mon Sep 17 00:00:00 2001
>> +From: "William A. Kennington III" <william@wkennington.com>
>> +Date: Tue, 27 Apr 2021 01:25:58 -0700
>> +Subject: [PATCH] network: neighbor: Always add neighbors with replace
>> +
>> +We were duplicating setting flags for the message and a combination of
>> +NLM_F_APPEND and NLM_F_CREATE which does not make sense. We should have
>> +been using NLM_F_REPLACE and NLM_F_CREATE since the kernel can
>> +dynamically create neighbors prior to us adding an entry. Otherwise, we
>> +can end up with cases where the message will time out after ~25s even
>> +though the neighbor still gets added. This delays the rest of the setup
>> +of the interface even though the error is ultimately ignored.
>> +
>> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/192a9d95ea3e058afd824d38a9cea16ad0a84a57]
>> +---
>> + src/libsystemd/sd-netlink/rtnl-message.c | 2 +-
>> + src/network/networkd-neighbor.c          | 4 ----
>> + 2 files changed, 1 insertion(+), 5 deletions(-)
>> +
>> +diff --git a/src/libsystemd/sd-netlink/rtnl-message.c b/src/libsystemd/sd-netlink/rtnl-message.c
>> +index 4cabbabba6..c9d0c9b1e7 100644
>> +--- a/src/libsystemd/sd-netlink/rtnl-message.c
>> ++++ b/src/libsystemd/sd-netlink/rtnl-message.c
>> +@@ -445,7 +445,7 @@ int sd_rtnl_message_new_neigh(sd_netlink *rtnl, sd_netlink_message **ret, uint16
>> +                 return r;
>> +
>> +         if (nlmsg_type == RTM_NEWNEIGH)
>> +-                (*ret)->hdr->nlmsg_flags |= NLM_F_CREATE | NLM_F_APPEND;
>> ++                (*ret)->hdr->nlmsg_flags |= NLM_F_CREATE | NLM_F_REPLACE;
>> +
>> +         ndm = NLMSG_DATA((*ret)->hdr);
>> +
>> +diff --git a/src/network/networkd-neighbor.c b/src/network/networkd-neighbor.c
>> +index c805d52cf3..adce055009 100644
>> +--- a/src/network/networkd-neighbor.c
>> ++++ b/src/network/networkd-neighbor.c
>> +@@ -259,10 +259,6 @@ static int neighbor_configure(Neighbor *neighbor, Link *link) {
>> +         if (r < 0)
>> +                 return log_link_error_errno(link, r, "Could not set state: %m");
>> +
>> +-        r = sd_netlink_message_set_flags(req, NLM_F_REQUEST | NLM_F_ACK | NLM_F_CREATE | NLM_F_REPLACE);
>> +-        if (r < 0)
>> +-                return log_link_error_errno(link, r, "Could not set flags: %m");
>> +-
>> +         r = sd_netlink_message_append_data(req, NDA_LLADDR, &neighbor->lladdr, neighbor->lladdr_size);
>> +         if (r < 0)
>> +                 return log_link_error_errno(link, r, "Could not append NDA_LLADDR attribute: %m");
>> +--
>> +2.31.1.498.g6c1eba8ee3d-goog
>> +
>> diff --git a/meta/recipes-core/systemd/systemd_247.6.bb b/meta/recipes-core/systemd/systemd_247.6.bb
>> index ce6ac7ebaa..fb4acf2d37 100644
>> --- a/meta/recipes-core/systemd/systemd_247.6.bb
>> +++ b/meta/recipes-core/systemd/systemd_247.6.bb
>> @@ -27,6 +27,7 @@ SRC_URI += "file://touchscreen.rules \
>>             file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
>>             file://0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch \
>>             file://0001-analyze-resolve-executable-path-if-it-is-relative.patch \
>> +           file://0001-network-neighbor-Always-add-neighbors-with-replace.patch \
>>             "
>>
>>  # patches needed by musl
>> --
>> 2.31.1.751.gd2f1c929bd-goog
>>
>>
>> 
>>
