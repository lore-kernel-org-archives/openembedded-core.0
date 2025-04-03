Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FE4C36014
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 00:37:56 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.2394.1743640667866792204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 17:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JQYu7IMd;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72c03d237a7so154972a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 17:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743640667; x=1744245467; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuSKhtCwhURwdMMUl6Vj42CaGQTtk2SvKYkC4T5hi0U=;
        b=JQYu7IMdQVBPX38I3dVBsjtsTSsKkIVW9NVg3rYDKiALFtCrQrFmLcadqH6554k71Z
         OmeyBO5VafMPaqMMT8p1NM4qCSbD8KwDlX9qHXRST1Fg0Wa4P1F9dcRRcmEcW4234MfG
         Jmy19pD58lRNi3VN50iWBRS+dHm4U4q660L9RWYpcGTldyyI9QzITD3tKCvTTrS/lpU6
         M76X3qUZffe2PX+ayBSFJDUOkAsf+VIREhKw/xHA7Ux6IduuBnzX4Mnq/9ViPeniCbwk
         Sq+2uR51e/j9JLcLG0sULuf0csJACrvwflUeJeR19j0A2IlFqFSGP7yORsahUSUMdTNP
         Xaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743640667; x=1744245467;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KuSKhtCwhURwdMMUl6Vj42CaGQTtk2SvKYkC4T5hi0U=;
        b=gDMQAwGXWdQCqbsmpkC2XgXjUSYwsBRYlwLin2+Ss06NRfBBQ2wkXVgX6Wn7UrVlsz
         9WpZ3PnC+o0/nPWx5GQ2+vyFa0iE3HocMMP67X3Mb3ztycVXw6tjTRiKuQwH3tsYO6Is
         3BzN6dMdocBfFp1lXO2U7lkWI9Wd8K0kUlGe022mlYGY9CATezM/LKWgd+WMZsQ+Tr0I
         gulu+amn+GTYdNOZOMVc+yVgtewZSZwoxQw9q8qU7S3jGEUgdOsboZG2cmKDMqFhyCr5
         A13ej8Jh9fKmkfZe+jOhfuVj6m/uUE9HkL6xn5B7tz9vheTkBc0Pl8LtKJxIo2QtdHJG
         lfXg==
X-Gm-Message-State: AOJu0YwVxjzS1GyiVctIeJVegjrnZ50Qjk2e1Xj/0CnbV1ogCJi8dYjR
	Bq0bvUBIC/JgDRP+lCnbSw9qAHdbTFvzrDG48sp//3D+Zv3aYguY
X-Gm-Gg: ASbGncvHM4FJrVQu9GGiwCGAtzJRwZaGrKYZCtBLn1IrC7Pzw9hVLNQgLRZkYqRoPRs
	p52EvcaaNCZpsuN0GhtNW9cwRVXTMeuV3X/UhhmVF8VWzn0aar+Pc3vTQ2LXdvpsLPl4pPe+76p
	RlP0tLjriD/n33+ektu/uFFFUdRG0RfTADmZo9fh5toJ/LjzPYTH5yjWoFl/+HOPfInUIqOkjxF
	hHzuIoAqzNvrg+FjI0MnRzX2nxSvQx2+Ck2gLRA/8yTQqYAY3nUPMHAzPrn2TdcYM4skOG8ag8O
	aFNZUJbyv/t1TLvrLUUd/72j/36bS0s8eB8qnlW4HDV4vVRRfKSZvWNHAaBb9JAt776xHIQtmuk
	3jx6KQ5xbFosuIiSIYLaoPloQpAMev8TxWe8Euw==
X-Google-Smtp-Source: AGHT+IGREjyReOg0gTDjfU7ZiOStlQ23H6XtqftsUciF9et5HdnqZaDYu3RTIx2QJUowh5EwQPxyCQ==
X-Received: by 2002:a05:6830:378a:b0:72b:a465:d955 with SMTP id 46e09a7af769-72c637a5971mr12895208a34.12.1743640666842;
        Wed, 02 Apr 2025 17:37:46 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:259d:91dc:bf30:aea7? ([2601:646:8201:fd20:259d:91dc:bf30:aea7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e30529cc5sm38100a34.33.2025.04.02.17.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 17:37:46 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------LftNGfCXYhAhvu2864Gk0uqI"
Message-ID: <78779584-17f7-484f-b4d5-b41cb37c777d@gmail.com>
Date: Wed, 2 Apr 2025 17:37:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] meta-qt6 on layerindex
To: samuli.piippo@gmail.com, martin.jansa@gmail.com
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Samuli Piippo <samuli.piippo@qt.io>, Tim Orling <ticotimo@gmail.com>,
 Ross Burton <ross.burton@arm.com>
References: <CA+chaQcpXOTbbePCjusXgrcR-Y9fk02JOnecFsR2e5B+==x7Eg@mail.gmail.com>
 <CABXoSoVs_O7At3c+=nM6w=fwgULniKACzu_8AwhZR9iat59UYQ@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CABXoSoVs_O7At3c+=nM6w=fwgULniKACzu_8AwhZR9iat59UYQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 00:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214292

This is a multi-part message in MIME format.
--------------LftNGfCXYhAhvu2864Gk0uqI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/2/25 12:37 AM, Samuli Piippo via lists.openembedded.org wrote:
> It would be great if I were able to, as the layer maintainer, add the 
> needed branch mappings to the layerindex.
> So far, Tim has been the one to update those.
>
> scarthgap -> 6.8
> styhead -> 6.9
>
> If Tim or other admin could add these branch mappings, that would be 
> great.
> The mapping can be added from admin view: Layer branches › Add layer 
> branch
> AFAIK, only Branch and Actual Branch values need to be set up.
> Once there is a layer branch set up, it appears, I also have access 
> rights to modify it.

What do the mappings look like, in any release there are multiple QT 
releases that are supported. LTS releases might make less combinations 
to map, how do these maps look when these branches become old but yocto 
release branch it is pointing to is LTS. There are many permutations and 
combinations.


>
> -samuli
>
>
>
> On Tue, 1 Apr 2025 at 13:07, Martin Jansa via lists.openembedded.org 
> <http://lists.openembedded.org> 
> <martin.jansa=gmail.com@lists.openembedded.org> wrote:
>
>     Hi,
>
>     some layers on layerindex cannot be correctly parsed because they
>     depend on meta-qt6 (qt6-layer) and there is no record of scarthgap or
>     styhead compatible release of meta-qt6 on layerindex.
>
>     There are:
>     https://layers.openembedded.org/layerindex/branch/kirkstone/layer/meta-qt6/
>     - actual branch 6.5
>     https://layers.openembedded.org/layerindex/branch/master/layer/meta-qt6/
>     - actual branch dev
>
>     but no
>     https://layers.openembedded.org/layerindex/branch/styhead/layer/meta-qt6/
>     https://layers.openembedded.org/layerindex/branch/scarthgap/layer/meta-qt6/
>
>     which causes e.g.:
>
>     ERROR: Issues found on branch styhead:
>         meta-luneos: Failed to add since LAYERDEPENDS [meta-luneui ...] is
>     not satisfied
>         meta-luneui: Failed to add since LAYERDEPENDS [qt6-layer ...] is
>     not satisfied
>     ERROR: Issues found on branch scarthgap:
>         meta-luneos: Failed to add since LAYERDEPENDS [meta-luneui ...] is
>     not satisfied
>         meta-luneui: Failed to add since LAYERDEPENDS [qt6-layer ...] is
>     not satisfied
>
>     and there will be more once meta-webosose parsing is fixed.
>
>     Is Tim the only person who can help with some admin changes on
>     layerindex? RP suggested to ask Ross as well.
>
>     I have admin rights to publish new layers (and edit all existing
>     layers), but cannot delete wrongly created ones (or their mapping) and
>     I'm not sure how to add a new mapping (e.g. add scarthgap and styhead
>     release for meta-qt6 by using actual branch 'dev' or '6.8').
>
>     meta-qt6 dev, 6.9 and 6.8 branches have:
>     LAYERSERIES_COMPAT_qt6-layer = "kirkstone langdale mickledore nanbield
>     scarthgap styhead walnascar"
>     6.7 doesn't have walnascar
>     6.6 and 6.5 (currently used for kirkstone) have:
>     LAYERSERIES_COMPAT_qt6-layer = "dunfell gatesgarth hardknott honister
>     kirkstone langdale mickledore nanbield scarthgap"
>
>     maybe even
>     https://layers.openembedded.org/layerindex/branch/kirkstone/layer/meta-qt6/
>     which is currently using actual branch 6.5 should be bumped to 6.8 as
>     well.
>
>     Cheers,
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214227):https://lists.openembedded.org/g/openembedded-core/message/214227
> Mute This Topic:https://lists.openembedded.org/mt/112022134/1997914
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
-Khem

--------------LftNGfCXYhAhvu2864Gk0uqI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/2/25 12:37 AM, Samuli Piippo via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABXoSoVs_O7At3c+=nM6w=fwgULniKACzu_8AwhZR9iat59UYQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div>It would be great if I were able to, as the layer
            maintainer, add the needed branch mappings to the
            layerindex.</div>
          <div>So far, Tim has been the one to update those.</div>
          <div><br>
          </div>
          <div>scarthgap -&gt; 6.8</div>
          <div>styhead -&gt; 6.9</div>
          <div><br>
          </div>
          <div>If Tim or other admin could add these branch mappings,
            that would be great.</div>
          <div>The mapping can be added from admin view: Layer branches
            › Add layer branch</div>
          <div>AFAIK, only Branch and Actual Branch values need to be
            set up.</div>
          <div>Once there is a layer branch set up, it appears, I also
            have access rights to modify it.</div>
        </div>
      </div>
    </blockquote>
    <p>What do the mappings look like, in any release there are multiple
      QT releases that are supported. LTS releases might make less
      combinations to map, how do these maps look when these branches
      become old but yocto release branch it is pointing to is LTS.
      There are many permutations and combinations.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CABXoSoVs_O7At3c+=nM6w=fwgULniKACzu_8AwhZR9iat59UYQ@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">
          <div><br>
          </div>
          <div>-samuli</div>
          <div><br>
          </div>
          <div><br>
          </div>
        </div>
        <br>
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">On Tue, 1 Apr 2025 at 13:07,
            Martin Jansa via <a href="http://lists.openembedded.org"
              moz-do-not-send="true">lists.openembedded.org</a>
            &lt;martin.jansa=<a
              href="mailto:gmail.com@lists.openembedded.org"
              moz-do-not-send="true" class="moz-txt-link-freetext">gmail.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
            <br>
            some layers on layerindex cannot be correctly parsed because
            they<br>
            depend on meta-qt6 (qt6-layer) and there is no record of
            scarthgap or<br>
            styhead compatible release of meta-qt6 on layerindex.<br>
            <br>
            There are:<br>
            <a
href="https://layers.openembedded.org/layerindex/branch/kirkstone/layer/meta-qt6/"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://layers.openembedded.org/layerindex/branch/kirkstone/layer/meta-qt6/</a><br>
            - actual branch 6.5<br>
            <a
href="https://layers.openembedded.org/layerindex/branch/master/layer/meta-qt6/"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://layers.openembedded.org/layerindex/branch/master/layer/meta-qt6/</a><br>
            - actual branch dev<br>
            <br>
            but no<br>
            <a
href="https://layers.openembedded.org/layerindex/branch/styhead/layer/meta-qt6/"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://layers.openembedded.org/layerindex/branch/styhead/layer/meta-qt6/</a><br>
            <a
href="https://layers.openembedded.org/layerindex/branch/scarthgap/layer/meta-qt6/"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://layers.openembedded.org/layerindex/branch/scarthgap/layer/meta-qt6/</a><br>
            <br>
            which causes e.g.:<br>
            <br>
            ERROR: Issues found on branch styhead:<br>
                meta-luneos: Failed to add since LAYERDEPENDS
            [meta-luneui ...] is<br>
            not satisfied<br>
                meta-luneui: Failed to add since LAYERDEPENDS [qt6-layer
            ...] is<br>
            not satisfied<br>
            ERROR: Issues found on branch scarthgap:<br>
                meta-luneos: Failed to add since LAYERDEPENDS
            [meta-luneui ...] is<br>
            not satisfied<br>
                meta-luneui: Failed to add since LAYERDEPENDS [qt6-layer
            ...] is<br>
            not satisfied<br>
            <br>
            and there will be more once meta-webosose parsing is fixed.<br>
            <br>
            Is Tim the only person who can help with some admin changes
            on<br>
            layerindex? RP suggested to ask Ross as well.<br>
            <br>
            I have admin rights to publish new layers (and edit all
            existing<br>
            layers), but cannot delete wrongly created ones (or their
            mapping) and<br>
            I'm not sure how to add a new mapping (e.g. add scarthgap
            and styhead<br>
            release for meta-qt6 by using actual branch 'dev' or '6.8').<br>
            <br>
            meta-qt6 dev, 6.9 and 6.8 branches have:<br>
            LAYERSERIES_COMPAT_qt6-layer = "kirkstone langdale
            mickledore nanbield<br>
            scarthgap styhead walnascar"<br>
            6.7 doesn't have walnascar<br>
            6.6 and 6.5 (currently used for kirkstone) have:<br>
            LAYERSERIES_COMPAT_qt6-layer = "dunfell gatesgarth hardknott
            honister<br>
            kirkstone langdale mickledore nanbield scarthgap"<br>
            <br>
            maybe even <a
href="https://layers.openembedded.org/layerindex/branch/kirkstone/layer/meta-qt6/"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://layers.openembedded.org/layerindex/branch/kirkstone/layer/meta-qt6/</a><br>
            which is currently using actual branch 6.5 should be bumped
            to 6.8 as<br>
            well.<br>
            <br>
            Cheers,<br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#214227): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/214227">https://lists.openembedded.org/g/openembedded-core/message/214227</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/112022134/1997914">https://lists.openembedded.org/mt/112022134/1997914</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
-Khem</pre>
  </body>
</html>

--------------LftNGfCXYhAhvu2864Gk0uqI--

