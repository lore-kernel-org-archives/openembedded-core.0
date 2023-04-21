Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBDDC77B76
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 20:28:24 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.23394.1682108902814734087
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 13:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RMCCUFhq;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7606d948295so62692039f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 13:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682108902; x=1684700902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9ST+CyCimC6SHDUV1oPjxFShEWa4yBIkx4f/sI3yYck=;
        b=RMCCUFhqFod40MdeC1m5/TCEdYclXfACWiTAl7leJVyEAOYzgKNBjkIrHgGYxPnl6s
         L6cULv3VyvR44g8zRCRytJ/xaALlXcY98mOvokgyU3Q3SAJF87d1sMJOYqZU8I0drW/r
         yPIUudUesUgGPuGiktConGr7qPQ2bSraaPfrAsO47r2quD3B2s7G0Fzjs/L31pYLzrqJ
         iU5K2QWKgvZG+M1timA+jbg25Y0OYPRxx/HkwgXUo1dF49PtkipJcJvF7ElTA7w5Tg+x
         QQj/wiaFXA+roy5AFAmRiSqTyk1uqbBT0zNfaJABInRhLuMjpAQqpfgoGyhrOWu0T7JS
         bwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682108902; x=1684700902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ST+CyCimC6SHDUV1oPjxFShEWa4yBIkx4f/sI3yYck=;
        b=NPwjRiixfDyElb596E12X2pKC1L80XCknMzebY85fFrZDiK09DLu3PnwbdLYTlxzhP
         zqNH/hso5wI5lwSj0EjHshIGGHoZ0HKz4KIwTOfHXuyBbUCJFjfL5yzDwwOW+94X9rRe
         7CBLqgElay4AxBgPdlQFUPYn4xwUgt7HQseLIUWfVjkpYqXGBJr8WVWQ6oVUkLpE99tb
         Csea4bN/or+zQ3yRJLaAtUipAAgYrisqMVPh3WqbwtWji/yFTLmra+5VGoEttGmxcPuR
         9Qwo1HTLYTYmy1hGXMxLbRKjQ3+Np1LTq3/BGYuQpm+5wVNFtuAGdnBHZll4pB6jwzOi
         ZWtQ==
X-Gm-Message-State: AAQBX9flNBgqXFu0T9qBQZp0g1Hr6aD5xuJIF5bacbPxFJFDoETw8Beh
	roHvHjarPe0R6/3XNfrNYSHj7JfvsSzhazbnNjg=
X-Google-Smtp-Source: AKy350b7gpWmeV9nofKTPN8U/fDTqGrs55Adc7qFMWl7EWk3s46JzVmcAG1EqjKADVi6lPGBYZqB2yoiWwmoz3joPYk=
X-Received: by 2002:a5e:a511:0:b0:74c:b069:f38c with SMTP id
 17-20020a5ea511000000b0074cb069f38cmr162672iog.1.1682108901831; Fri, 21 Apr
 2023 13:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230416103052.28268-1-christoph.lauer@email.de>
 <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
 <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
 <CADkTA4N9Sypxccr0OU6KQxPK5rbsL_mNFGaJ2Zn_jYHL1tNSEg@mail.gmail.com>
 <652908a6640ffc911d46613cb99159086131416f.camel@linuxfoundation.org>
 <CADkTA4MBh46pqJoQjW4dhOc3Sw-4+rr-u4d48OPSs9eC1VPx8A@mail.gmail.com>
 <CANPvuR=M0-ndA609d2i43rgVVSPrHzEeo5o7orRjmeR9BA5_QQ@mail.gmail.com>
 <CADkTA4MMj6qUNHyjNV6QxE0iZAwA8=Ur6Ks4_7ETJtmrv6TrNA@mail.gmail.com>
 <CANPvuRmb7Kh3hgjZEcr1vU4czrULvLYabk3apBERQbo4RJ8y3w@mail.gmail.com>
 <afb0f1d6405256d9dfc6bd5bc0a642ddb1dd82c5.camel@linuxfoundation.org> <175785898B60CE37.9727@lists.openembedded.org>
In-Reply-To: <175785898B60CE37.9727@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Apr 2023 16:28:21 -0400
Message-ID: <CADkTA4MQty2wAcBrDGT=vqVeAHpMbzKjpf8-6xbH7UKa2R6wsg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: bruce.ashfield@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Jose Quaresma <quaresma.jose@gmail.com>, Christoph Lauer <christoph.lauer@email.de>, 
	openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: multipart/mixed; boundary="00000000000091669b05f9de7f57"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 20:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180296

--00000000000091669b05f9de7f57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 11:03=E2=80=AFPM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Wed, Apr 19, 2023 at 6:54=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2023-04-19 at 23:34 +0100, Jose Quaresma wrote:
> > > Hi,
> > >
> > > Not related with the previous discussion but just for
> > > your information.
> > > The rm_work.bbclass has an exception for the kernel recipes [1].
> > > So I don't understand why we can't do the same for the make-mod-
> > > scripts
> > > who is the twin brother of all these kernel recipes.
> > >
> > > [1]
> > > https://git.openembedded.org/openembedded-core/tree/meta/classes/rm_w=
ork.bbclass#n168
> >
> > Ideally we wouldn't be doing this for the kernel recipes.
> >
> > There is also a big difference to that and the proposed patch. The
> > proposed patch was preserving a specific directory rather than an
> > entire recipe. Removing the task stamps but leaving a small piece of
> > WORKDIR is quite different to preserving WORKDIR and STAMPS for a
> > specific recipe. The former is not tested and will break things. The
> > latter is better tolerated by bitbake.
>
> Agreed.
>
> Plus, I am working on this now.
>
> I have static linking of the scripts/tools working, but what I haven't
> figured out is how to do that without patching the Makefiles.
>

It turned out to be quite the battle to get older kernels what was
required for static linking of the tools.

Attached is my WIP patch. I'm out of the office early next week, but
will revisit it once I'm back.

Bruce

> Next up will be some rpath trickery.
>
> Bruce
>
> >
> > So yes, we could do the same. I'm sure there will be other recipes
> > people want to preserve for other reasons. Where do we draw the line?
> > We could preserve everything and drop rm_work, then we wouldn't have
> > these problems? :)
> >
> > Cheers,
> >
> > Richard
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180233): https://lists.openembedded.org/g/openembedde=
d-core/message/180233
> Mute This Topic: https://lists.openembedded.org/mt/98296212/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000091669b05f9de7f57
Content-Type: application/octet-stream; 
	name="0001-make-mod-scripts-force-static-linking-and-make-depen.patch"
Content-Disposition: attachment; 
	filename="0001-make-mod-scripts-force-static-linking-and-make-depen.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lgr078ed0>
X-Attachment-Id: f_lgr078ed0

RnJvbSAyOWNkNzdiMTc4ODRiMGUzZDMyZDdjMGNhNDQxOGE5M2FkNWQ4NDRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwu
Y29tPgpEYXRlOiBGcmksIDIxIEFwciAyMDIzIDEyOjMxOjMxIC0wNDAwClN1YmplY3Q6IFtQQVRD
SF0gbWFrZS1tb2Qtc2NyaXB0czogZm9yY2Ugc3RhdGljIGxpbmtpbmcgYW5kIG1ha2UgZGVwZW5k
ZW5jaWVzCiBleHBsaWNpdAoKV2hlbiB0aGUgc2NyaXB0cyBhcmUgcHJlcGFyZWQgZnJvbSB0aGUg
a2VybmVsIHNvdXJlLCB0aGVyZSBhcmUgc29tZQpleGVjdXRhYmxlcyB0aGF0IGNhbiBhbHNvIGJl
IGNyZWF0ZWQgKGRlcGVuZGluZyBvbiBrZXJuZWwKY29uZmlndXJhdGlvbikuIHNpZ24tZmlsZSBh
bmQgb2JqdG9vbCBhcmUgdHdvIGV4YW1wbGVzIHdoaWNoIGFyZQpjb21tb25seSBjcmVhdGVkLgoK
RHVlIHRvIHRoZSB3YXkgdGhhdCB0aGUga2VybmVsIHNvdXJjZSBpcyBzdGFnZWQsIGFuZCBidWls
ZCBhcnRpZmFjdHMKYXJlIHN0b3JlZCBmb3IgcmV1c2UgYW5kIHBlcmZvcm1hbmNlIHdlIGNhbiBl
bmQgdXAgaW4gYSBzY2VuYXJpbyB3aGVyZQp0aGUgYnVpbGQgYXJ0aWZhY3RzIGJhc2VkIGV4ZWN1
dGFibGUgaXMgbGlua2VkIGFnYWluc3Qgc2hhcmVkCmxpYnJhcmllcyBpbiB0aGUgcmVjaXBlIG5h
dGl2ZSBzeXNyb290IChzc2wgb3IgY3J5cHRvKS4KCldlIGNvdWxkIG1hbmlwdWxhdGUgcnBhdGgs
IGluc3RhbGwgdGhlIGxpYnJhcmllcyB0byBidWlsZC1hcnRpZmFjdHMKYW5kIGFycmFuZ2UgdG8g
aGF2ZSBhdmFpbGFibGUgd2hlbiB0aGUgaG9zdCB0b29scyBhcmUgdXNlZCBvciBldmVuCmNyZWF0
ZWQgYSBmdWxsIG5hdGl2ZSBwYWNrYWdlIGZyb20gdGhlIHRvb2xzIGdlbmVyYXRlZCBvdXQgb2Yg
c2NyaXB0cy4KClRob3NlIGFwcHJvYWNoZXMgaGF2ZSBkcmF3YmFja3MgaW4gY29tcGxleGl0eSwg
cmVsb2NhdGFiaWxpdHkgYW5kL29yCnN5bmNocm9uaXphdGlvbiBpc3N1ZXMgd2l0aCB0aGUga2Vy
bmVsIHNvdXJjZS4KClRoZSBjaG9zZW4gYXBwcm9hY2ggaGVyZSBpcyB0byBmb3JjZSBzdGF0aWMg
bGlua2luZyBvbiB0aGUgdG9vbHMsCndoaWNoIGFsbG93cyB0aGVtIHRvIGJlIHBsYWNlZCBpbnRv
IGJ1aWxkIGFydGlmYWN0cyB3aXRob3V0IGFueQpyZWZlcmVuY2VzIHRvIHRoZSByZWNpcGUgbmF0
aXZlIHN5c3Jvb3QuCgprZXJuZWwncyBuZXdlciB0aGFuIDUuMTUrIGFsbG93IHVzIHRvIGFkZCB0
aGUgLXN0YXRpYyBwYXJhbWV0ZXIKdG8gcGtnLWNvbmZpZywgYnV0IG9sZGVyIGtlcm5lbHMgZG8g
bm90IGhhdmUgdGhhdCBmbGV4aWJsaXR5LiBBcwphIHJlc3VsdCwgd2UgaGF2ZSB0d28gYXBwcm9h
Y2hlcyB0byBlbnN1cmUgdGhhdCB0aGUgbGlicmFyaWVzCm5lZWRlZCBmb3Igc3RhdGljIGxpbmtp
bmcgYXJlIGRldGVjdGVkIChvbmUgdmlhIHBrZy1jb25maWcgYW5kCnRoZSBvdGhlciB2aWEgaG9z
dCBsZGZsYWdzKS4gSW4gdGhlIGZ1dHVyZSB3ZSBjYW4gZHJvcCB0aGUgbGRmbGFncwphcHByb2Fj
aCAod2hlbiB0aGUgb2xkZXN0IHN1cHBvcnRlZCBrZXJuZWxzIGFyZSA+IDUuMTUpLgoKVGhlcmUg
YXJlIGFsc28gc29tZSBwb3RlbnRpYWxseSBtaXNzaW5nIGRlcGVuZGVuY2llcyB3aGVuIHRvb2xz
Cmxpa2Ugc2lnbi1maWxlIGFyZSBidWlsdCwgc28gd2UgYWRkIHRoZW0gZXhwbGljaXRseSB0byB0
aGUgcmVjaXBlCmFuZCBhdm9pZCBhbnkgcmFjZXMgb3IgaW1wbGljaXQgZGVwZW5kZW5jaWVzLgoK
U2lnbmVkLW9mZi1ieTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4K
LS0tCiAuLi4vbWFrZS1tb2Qtc2NyaXB0cy9tYWtlLW1vZC1zY3JpcHRzXzEuMC5iYiAgfCAyNiAr
KysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL21ha2UtbW9kLXNj
cmlwdHMvbWFrZS1tb2Qtc2NyaXB0c18xLjAuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL21ha2Ut
bW9kLXNjcmlwdHMvbWFrZS1tb2Qtc2NyaXB0c18xLjAuYmIKaW5kZXggMjhlMDgwN2QxZC4uZTBl
YmMzODAyYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9tYWtlLW1vZC1zY3JpcHRz
L21ha2UtbW9kLXNjcmlwdHNfMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbWFrZS1t
b2Qtc2NyaXB0cy9tYWtlLW1vZC1zY3JpcHRzXzEuMC5iYgpAQCAtMTAsMjUgKzEwLDQ1IEBAIFBB
Q0tBR0VfQVJDSCA9ICIke01BQ0hJTkVfQVJDSH0iCiAKIFMgPSAiJHtXT1JLRElSfSIKIAotZG9f
Y29uZmlndXJlW2RlcGVuZHNdICs9ICJ2aXJ0dWFsL2tlcm5lbDpkb19zaGFyZWRfd29ya2RpciBv
cGVuc3NsLW5hdGl2ZTpkb19wb3B1bGF0ZV9zeXNyb290IgorIyB6bGliIGlzIHJlcXVpcmVkIHdo
ZW4gbW9kdWxlIHNpZ25pbmcgaXMgZW5hYmxlZAorZG9fY29uZmlndXJlW2RlcGVuZHNdICs9ICJ2
aXJ0dWFsL2tlcm5lbDpkb19zaGFyZWRfd29ya2RpciBvcGVuc3NsLW5hdGl2ZTpkb19wb3B1bGF0
ZV9zeXNyb290IHpsaWItbmF0aXZlOmRvX3BvcHVsYXRlX3N5c3Jvb3QiCiBkb19jb21waWxlW2Rl
cGVuZHNdICs9ICJ2aXJ0dWFsL2tlcm5lbDpkb19jb21waWxlX2tlcm5lbG1vZHVsZXMiCiAKIERF
Vl9QS0dfREVQRU5ERU5DWSA9ICIiCiAKIERFUEVORFMgKz0gImJjLW5hdGl2ZSBiaXNvbi1uYXRp
dmUiCiBERVBFTkRTICs9ICJnbXAtbmF0aXZlIgorIyByZXF1aXJlZCBmb3IgbW9kdWxlIHNpZ25p
bmcgc3VwcG9ydAorREVQRU5EUyArPSAiZWxmdXRpbHMtbmF0aXZlIgogCi1FWFRSQV9PRU1BS0Ug
PSAiIEhPU1RDQz0iJHtCVUlMRF9DQ30gJHtCVUlMRF9DRkxBR1N9ICR7QlVJTERfTERGTEFHU30i
IEhPU1RDUFA9IiR7QlVJTERfQ1BQfSIiCi1FWFRSQV9PRU1BS0UgKz0gIiBIT1NUQ1hYPSIke0JV
SUxEX0NYWH0gJHtCVUlMRF9DWFhGTEFHU30gJHtCVUlMRF9MREZMQUdTfSIgQ1JPU1NfQ09NUElM
RT0ke1RBUkdFVF9QUkVGSVh9IgorIyB3ZSBhcmUgc3RhdGljYWxseSBidWlsZGluZyB0aGUgc3Vw
cG9ydCB0b29scywgc2luY2UgdGhlIG91dHB1dCBvZiB0aGUgYnVpbGQgaXMKKyMgc3RvcmVkIGlu
IFNUQUdJTkdfS0VSTkVMX0JVSUxERElSLiBXZSBkbyBub3Qgd2FudCBhbnkgZHluYW1pYyByZWZl
cmVuY2VzIHRvCisjIGxpYnJhcmllcyB0aGF0IGFyZSBvbmx5IHByZXNlbnQgaW4gdGhlIHJlY2lw
ZSBuYXRpdmUgc3lzcm9vdAorRVhUUkFfT0VNQUtFID0gIiBIT1NUQ0M9IiR7QlVJTERfQ0N9ICR7
QlVJTERfQ0ZMQUdTfSAke0JVSUxEX0xERkxBR1N9IC1zdGF0aWMiIEhPU1RDUFA9IiR7QlVJTERf
Q1BQfSIiCitFWFRSQV9PRU1BS0UgKz0gIiBIT1NUQ1hYPSIke0JVSUxEX0NYWH0gJHtCVUlMRF9D
WFhGTEFHU30gJHtCVUlMRF9MREZMQUdTfSAtc3RhdGljIiBDUk9TU19DT01QSUxFPSR7VEFSR0VU
X1BSRUZJWH0iCiAKICMgQnVpbGQgc29tZSBob3N0IHRvb2xzIHVuZGVyIHdvcmstc2hhcmVkLiAg
Q0MsIExELCBhbmQgQVIgYXJlIHByb2JhYmx5CiAjIG5vdCB1c2VkLCBidXQgdGhpcyBpcyB0aGUg
aGlzdG9yaWNhbCB3YXkgb2YgaW52b2tpbmcgIm1ha2Ugc2NyaXB0cyIuCiAjCiBkb19jb25maWd1
cmUoKSB7CisJIyBzZXR1cCBuYXRpdmUgcGtnLWNvbmZpZyB2YXJpYWJsZXMsIEhPU1RQS0dfQ09O
RklHIGlzIGF2YWlsYWJsZSBpbiBuZXdlciBrZXJuZWxzCisJIyBidXQgd2Uga2VlcCB0aGVzZSB0
byBzdXBwb3J0IG9sZGVyIGtlcm5lbHMgdGhhdCBtYXkgbm90IGhhdmUgdGhlIHZhcmlhYmxlIHRv
CisJIyBhYnN0cmFjdCBjYWxscyB0byBwa2ctY29uZmlnCisJZXhwb3J0IFBLR19DT05GSUdfRElS
PSIke1NUQUdJTkdfRElSX05BVElWRX0ke2xpYmRpcl9uYXRpdmV9L3BrZ2NvbmZpZyIKKwlleHBv
cnQgUEtHX0NPTkZJR19QQVRIPSIkUEtHX0NPTkZJR19ESVI6JHtTVEFHSU5HX0RBVEFESVJfTkFU
SVZFfS9wa2djb25maWciCisJZXhwb3J0IFBLR19DT05GSUdfTElCRElSPSIkUEtHX0NPTkZJR19E
SVIiCisJZXhwb3J0IFBLR19DT05GSUdfU1lTUk9PVF9ESVI9IiIKKworCSMgZm9yIHByZS01LjE1
IGtlcm5lbHMKKwlMSUJFTEZfTElCUz0kKHBrZy1jb25maWcgbGliZWxmIC0tbGlicyAyPi9kZXYv
bnVsbCB8fCBlY2hvIC1sZWxmKQorCWV4cG9ydCBMSUJFTEZfTElCUz0iJEhPU1RfTElCRUxGX0xJ
QlMgLWx6IgorCWV4cG9ydCBIT1NUTERGTEFHUz0iLWx6IgorCiAJdW5zZXQgQ0ZMQUdTIENQUEZM
QUdTIENYWEZMQUdTIExERkxBR1MKIAlmb3IgdCBpbiBwcmVwYXJlIHNjcmlwdHNfYmFzaWMgc2Ny
aXB0czsgZG8KIAkJb2VfcnVubWFrZSBDQz0iJHtLRVJORUxfQ0N9IiBMRD0iJHtLRVJORUxfTER9
IiBcCiAJCUFSPSIke0tFUk5FTF9BUn0iIE9CSkNPUFk9IiR7S0VSTkVMX09CSkNPUFl9IiBcCisJ
CUhPU1RQS0dfQ09ORklHPSJwa2ctY29uZmlnIC0tc3RhdGljIiBcCiAJCS1DICR7U1RBR0lOR19L
RVJORUxfRElSfSBPPSR7U1RBR0lOR19LRVJORUxfQlVJTERESVJ9ICR0CiAJZG9uZQogfQotLSAK
Mi4zNC4xCgo=
--00000000000091669b05f9de7f57--

